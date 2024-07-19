# Maintainer: verysillycat
## Forked from vesktop-git

## options
#: ${_electron_version:=31}
: ${_install_path:=usr/share}

# basic info
_pkgname="sunroof"
pkgname="$_pkgname-git"
pkgdesc="Forked Custom Discord desktop app with Suncord preinstalled"
pkgver=1.6.1
pkgrel=1
url="https://github.com/verticalsync/Sunroof"
license=('GPL-3.0-only')
arch=("any")

# electron version detection
if [ -z "$_electron_version" ]; then
  _electron_version_request=$(
    curl -LSsf https://github.com/verticalsync/Sunroof/raw/main/package.json \
      | grep '"electron":' \
      | sed -Ee 's@^\s*"electron": "\^([0-9]+)\..*".*$@\1@' \
      | sort -rV | head -1
  )
fi

if [ -n "$_electron_version_request" ]; then
  if pacman -Qi "electron${_electron_version_request:?}" > /dev/null 2>&1 || pacman -Qi "electron${_electron_version_request:?}-bin" > /dev/null 2>&1; then
    : ${_electron_version:=$_electron_version_request}
  fi
fi

# continue package
depends=(
  "electron${_electron_version:-}"
)
makedepends=(
  'git'
  'pnpm'
)
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=(
  "$_pkgname"
  "suncord"
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  export SYSTEM_ELECTRON_VERSION=$(< "/usr/lib/electron${_electron_version:-}/version")
  export ELECTRONVERSION=${SYSTEM_ELECTRON_VERSION%%.*}

  sed -E \
    -e 's&^(\s*)("electron"): "(.*)"(,?)$&\1\2: "'"$SYSTEM_ELECTRON_VERSION"'"\4&' \
    -e '/linux/s&^&"electronDist": "/usr/lib/electron'"${_electron_version:-}"'",\n&' \
    -i "$_pkgsrc/package.json"

  cd "$_pkgsrc"
  pnpm install
  pnpm package:dir
}

package() {
  install -d "$pkgdir/$_install_path/$_pkgname"
  cp --reflink=auto -r "$_pkgsrc/dist/linux-unpacked/resources/app.asar" "$pkgdir/$_install_path/$_pkgname/"

  install -Dm644 "$_pkgsrc/static/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
XDG_CONFIG_HOME="\${XDG_CONFIG_HOME:-\$HOME/.config}"
_FLAGS_FILE="\$XDG_CONFIG_HOME/${_pkgname}-flags.conf"

if [ -r "\$_FLAGS_FILE" ]; then
  _USER_FLAGS="\$(grep -v '^#' "\$_FLAGS_FILE")"
fi

exec electron${_electron_version:-} /$_install_path/$_pkgname/app.asar \$_USER_FLAGS "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=Sunroof
GenericName=Internet Messenger
Comment=$pkgdesc
Type=Application
Exec=$_pkgname
Icon=$_pkgname
Categories=Network;InstantMessaging;
StartupWMClass=sunroof;
Keywords=discord;suncord;sunroof
END
}
