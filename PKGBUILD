# Maintainer:

## options
if [[ (-z "$_srcinfo" && -z "$_pkgver") ]]; then
  : ${_autoupdate:=true}
fi

: ${_dotnet_type=-bin}
: ${_install_path:=usr/lib}

_pkgname="ryujinx"
pkgname="$_pkgname-canary"
pkgver=1.3.227
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://git.ryujinx.app/ryubing/ryujinx"
license=('MIT')
arch=('x86_64')

provides=("$_pkgname")
conflicts=("$_pkgname")

depends=(
  'alsa-lib'
  'fontconfig'
  'jack'
  'libpulse'
  'libx11'
  'wayland'
)
makedepends=(
  "dotnet-sdk${_dotnet_type:-}"
  'desktop-file-utils'
)

options=('!strip' '!debug')

_source_ryujinx() {
  _pkgsrc="${_pkgname}-Canary-$_pkgver"
  _pkgext="tar.gz"
  source=("${_pkgsrc,,}.$_pkgext"::"$url/-/archive/${_tag:-$_pkgver}/$_pkgsrc.$_pkgext")
  sha256sums=('SKIP')
}

pkgver() {
  echo "${_pkgver:?}"
}

build() (
  export HOME="$SRCDEST/nuget-home"
  export DOTNET_CLI_TELEMETRY_OPTOUT=1

  mkdir -p "$HOME" # must exist

  local _runtime="linux-x64"
  local _args=(
    -c Release
    -r "$_runtime"
    --disable-build-servers
    --nologo
    --self-contained true
    -p:DebugType=none
    -p:ExtraDefineConstants=DISABLE_UPDATER
    -p:PublishSingleFile=true
    -p:Version="$pkgver"
    -p:RuntimeIdentifiers="$_runtime"
  )

  echo "Building AVA Interface..."
  dotnet publish "${_args[@]}" -o publish_ava "$_pkgsrc/src/Ryujinx"

  echo "Shutting down dotnet build server in background."
  (timeout -k 45 30 dotnet build-server shutdown) > /dev/null 2>&1 &
)

package() {
  # program
  mkdir -pm755 "$pkgdir/$_install_path/$_pkgname"
  cp -a publish_ava/* "$pkgdir/$_install_path/$_pkgname/"

  # symlink
  mkdir -pm755 "$pkgdir/usr/bin"
  ln -s "/$_install_path/ryujinx/Ryujinx" "$pkgdir/usr/bin/$_pkgname"

  # launcher
  local _launcher="$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 "$_pkgsrc"/distribution/linux/Ryujinx.desktop "$_launcher"

  desktop-file-edit --set-key="Exec" --set-value="$_pkgname %f" "$_launcher"
  desktop-file-edit --set-icon="$_pkgname" "$_launcher"

  # icon
  install -Dm644 "$_pkgsrc"/distribution/misc/Logo.svg "$pkgdir/usr/share/pixmaps/$_pkgname.svg"

  # mimetype
  install -Dm644 "$_pkgsrc"/distribution/linux/mime/Ryujinx.xml "$pkgdir/usr/share/mime/packages/$_pkgname.xml"

  # license
  install -Dm644 "$_pkgsrc"/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # permissions
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/$_install_path/$_pkgname/Ryujinx"
  chmod 755 "$pkgdir/$_install_path/$_pkgname/Ryujinx.sh"
}

_update_version() {
  : ${_pkgver:=$pkgver}

  if [[ "${_autoupdate::1}" != "t" ]]; then
    return
  fi

  local _response _pkgver_new
  _response=$(curl -Ssf -L --max-redirs 3 "$url/-/tags?format=atom")
  _tag=$(
    printf '%s' "$_response" \
      | grep -E '/tags/Canary-([0-9\.]+)"' \
      | sed -E 's&^.*/tags/(Canary-[0-9\.]+)".*$&\1&' \
      | sort -rV | head -1
  )
  _pkgver_new="${_tag#Canary-}"

  if [ "$_pkgver" != "${_pkgver_new:?}" ]; then
    _pkgver="${_pkgver_new:?}"
  fi
}

_update_version
_source_ryujinx
