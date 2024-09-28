# Maintainer:
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

## options
if [ -z "$_srcinfo" ] && [ -z "$_pkgver" ]; then
  : ${_autoupdate:=true}
fi

## basic info
_pkgname="ryujinx"
pkgname="$_pkgname"
pkgver=1.1.1400
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
arch=('x86_64')

depends=(
  'gcc-libs'
  'zlib'
)
makedepends=(
  'desktop-file-utils'
  'dotnet-sdk-bin' # aur/dotnet-core-bin
)

options=('!strip' '!debug' 'emptydirs')
install="$_pkgname.install"

_source_ryujinx() {
  _pkgsrc="Ryujinx-$_pkgver"
  _pkgext="tar.gz"
  source=("$_pkgname-$_pkgver.$_pkgext"::"$url/archive/$_pkgver.$_pkgext")
  sha256sums=('SKIP')
}

pkgver() {
  echo "${_pkgver:?}"
}

build() {
  cd "$_pkgsrc"

  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  dotnet clean
  dotnet nuget locals all -c

  local _args=(
    -c Release
    -r linux-x64
    --nologo
    --self-contained true
    -p:DebugType=none
    -p:ExtraDefineConstants=DISABLE_UPDATER
    -p:Version=${pkgver%%.r*}
  )

  echo "Building AVA Interface..."
  dotnet publish "${_args[@]}" -o publish_ava src/Ryujinx

  echo "Building GTK3 Interface..."
  dotnet publish "${_args[@]}" -o publish_gtk src/Ryujinx.Gtk3

  echo "Building SDL2 Headless..."
  dotnet publish "${_args[@]}" -o publish_sdl src/Ryujinx.Headless.SDL2

  echo "Shutting down dotnet build server in background."
  (timeout -k 45 30 dotnet build-server shutdown) > /dev/null 2>&1 &
}

package() {
  cd "$_pkgsrc"

  # program
  install -dm755 "$pkgdir/opt/ryujinx"
  cp -a --update=none --reflink=auto publish_ava/* "$pkgdir/opt/ryujinx/"
  cp -a --update=none --reflink=auto publish_gtk/* "$pkgdir/opt/ryujinx/"
  cp -a --update=none --reflink=auto publish_sdl/* "$pkgdir/opt/ryujinx/"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/ryujinx/Ryujinx" "$pkgdir/usr/bin/ryujinx"
  ln -s "/opt/ryujinx/Ryujinx.Gtk3" "$pkgdir/usr/bin/ryujinx.gtk"
  ln -s "/opt/ryujinx/Ryujinx.Headless.SDL2" "$pkgdir/usr/bin/ryujinx.sdl"

  # .desktop
  install -Dm644 distribution/linux/Ryujinx.desktop "$pkgdir/usr/share/applications/ryujinx.desktop"

  # icon
  install -Dm644 distribution/misc/Logo.svg "$pkgdir/usr/share/pixmaps/ryujinx.svg"

  # mimetype
  install -Dm644 distribution/linux/mime/Ryujinx.xml "$pkgdir/usr/share/mime/packages/ryujinx.xml"

  # license
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # fix permissions
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/opt/ryujinx/Ryujinx"
  chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.Gtk3"
  chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.Headless.SDL2"
  chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.sh"

  # writable log directory
  install -dm777 "$pkgdir/opt/ryujinx/Logs"

  # fix desktop file
  desktop-file-edit --set-key="Exec" --set-value="ryujinx %f" "$pkgdir/usr/share/applications/ryujinx.desktop"
  desktop-file-edit --set-icon="ryujinx" "$pkgdir/usr/share/applications/ryujinx.desktop"
}

_update_version() {
  : ${_pkgver:=${pkgver%%.r*}}

  if [[ "${_autoupdate::1}" != "t" ]]; then
    return
  fi

  local _response=$(curl -Ssf "$url/releases.atom")
  local _tag=$(
    printf '%s' "$_response" \
      | grep '"https://.*/releases/tag/.*"' \
      | sed -E 's@^.*/releases/tag/(.*)".*$@\1@' \
      | grep -Ev '[a-z]{2}' | sort -rV | head -1
  )
  local _pkgver_new="${_tag#v}"

  # update _pkgver
  if [ "$_pkgver" != "${_pkgver_new:?}" ]; then
    _pkgver="${_pkgver_new:?}"
  fi
}

_update_version
_source_ryujinx
