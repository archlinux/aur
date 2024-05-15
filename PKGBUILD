# Maintainer:
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

## options
if [ -n "$_srcinfo" ] || [ -n "$_pkgver" ]; then
  : ${_autoupdate:=false}
else
  : ${_autoupdate:=true}
fi

: ${_build_git:=false}

unset _pkgtype
[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname="ryujinx"
pkgname="$_pkgname${_pkgtype:-}"
pkgver=1.1.1310
pkgrel=1
pkgdesc="Experimental Nintendo Switch Emulator written in C#"
url="https://github.com/Ryujinx/Ryujinx"
license=('MIT')
arch=(x86_64)

# main package
_main_package() {
  makedepends=(
    'desktop-file-utils'
    'dotnet-sdk>=8.0.4.sdk204' # AUR: dotnet-core-bin
  )

  options=('!strip' '!debug')
  install="$_pkgname.install"

  if [ "${_build_git::1}" != "t" ]; then
    _main_stable
  else
    _main_git
  fi
}

# stable package
_main_stable() {
  _update_version

  _pkgsrc="Ryujinx-$_pkgver"
  _pkgext="tar.gz"
  source=("$_pkgname-$_pkgver.$_pkgext"::"$url/archive/$_pkgver.$_pkgext")
  sha256sums=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  makedepends+=('git')

  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"

    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

# common functions
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

  dotnet publish "${_args[@]}" -o publish_ava src/Ryujinx
  dotnet publish "${_args[@]}" -o publish_gtk src/Ryujinx.Gtk3
}

package() {
  cd "$_pkgsrc"

  # program
  install -dm755 "$pkgdir/opt/ryujinx"
  cp --reflink=auto -r publish_gtk/* "$pkgdir/opt/ryujinx/"
  cp --reflink=auto -r publish_ava/* "$pkgdir/opt/ryujinx/"

  # symlinks
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/ryujinx/Ryujinx" "$pkgdir/usr/bin/ryujinx"
  ln -s "/opt/ryujinx/Ryujinx.Gtk3" "$pkgdir/usr/bin/ryujinx.gtk"

  # .desktop
  install -Dm644 distribution/linux/Ryujinx.desktop "$pkgdir/usr/share/applications/ryujinx.desktop"

  # icon
  install -Dm644 distribution/misc/Logo.svg "$pkgdir/usr/share/pixmaps/ryujinx.svg"

  # mimetype
  install -Dm644 distribution/linux/mime/Ryujinx.xml "$pkgdir/usr/share/mime/packages/ryujinx.xml"

  # license
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/"

  # fix permissions
  #chmod -R u=rwX,go=rX "$pkgdir"
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -exec chmod 644 {} \;
  chmod 755 "$pkgdir/opt/ryujinx/Ryujinx"
  chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.Gtk3"
  chmod 755 "$pkgdir/opt/ryujinx/Ryujinx.sh"

  # writable log directory
  install -dm777 "$pkgdir/opt/ryujinx/Logs"

  # fix desktop file
  desktop-file-edit --set-key="Exec" --set-value="ryujinx %f" "$pkgdir/usr/share/applications/ryujinx.desktop"
  desktop-file-edit --set-icon="ryujinx" "$pkgdir/usr/share/applications/ryujinx.desktop"
}

# update version
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

# execute
_main_package
