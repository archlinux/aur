# Maintainer: verysillycat
## Forked from vesktop-git

## options
#: ${_electron_version:=31}
: ${_install_path:=usr/share}

# basic info
_pkgname="equibop"
pkgname="$_pkgname-git"
pkgdesc="Forked Custom Discord desktop app with Equicord preinstalled"
pkgver=3.0.4.r0.g72ecac1
pkgrel=1
url="https://github.com/Equicord/Equibop"
license=('GPL-3.0-only')
arch=("any")
install=equibop.install

# electron version detection
if [ -z "$_electron_version" ]; then
  _electron_version_request=$(
    curl -LSsf https://github.com/Equicord/Equibop/raw/main/package.json \
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
  'bun'
  'cmake'
  'gcc'
)
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=(
  "$_pkgname"
  "equibop"
)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git"
        'equibop.install')
sha256sums=('SKIP'
            '18b5fbb1bf53b47b8a7438b2127b1f1a31d23c69d39a156cde66e1616710a18a')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  bun install
  bun run buildLibVesktop
  bun run package:dir
}

package() {
  install -d "$pkgdir/$_install_path/$_pkgname"
  cp --reflink=auto -r "$_pkgsrc/dist/linux-unpacked/resources/app.asar" "$pkgdir/$_install_path/$_pkgname/"
  cp --reflink=auto -r "$_pkgsrc/dist/linux-unpacked/resources/app.asar.unpacked" "$pkgdir/$_install_path/$_pkgname/"
  cp --reflink=auto -r "$_pkgsrc/dist/linux-unpacked/resources/bun" "$pkgdir/$_install_path/$_pkgname/"

  install -Dm644 "$_pkgsrc/static/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/$_pkgname" << END
#!/usr/bin/env sh
XDG_CONFIG_HOME="\${XDG_CONFIG_HOME:-\$HOME/.config}"
_FLAGS_FILE="\$XDG_CONFIG_HOME/${_pkgname}-flags.conf"

if [ -r "\$_FLAGS_FILE" ]; then
  _USER_FLAGS="\$(grep -v '^#' "\$_FLAGS_FILE")"
fi

if [ "\$XDG_SESSION_TYPE" = "wayland" ] && [ "\$1" = "--wayland" ]; then
  echo "Forcing Wayland"
  _WAYLAND_FLAGS="--enable-features=UseOzonePlatform,WaylandWindowDecorations,VaapiVideoDecodeLinuxGL --ozone-platform=wayland"
  shift
fi

exec electron${_electron_version:-} /$_install_path/$_pkgname/app.asar \$_USER_FLAGS \$_WAYLAND_FLAGS "\$@"
END

  install -Dm755 /dev/stdin "$pkgdir/usr/share/applications/org.equicord.$_pkgname.desktop" << END
[Desktop Entry]
Name=Equibop
GenericName=Internet Messenger
Comment=$pkgdesc
Type=Application
Exec=$_pkgname
Icon=$_pkgname
Categories=Network;InstantMessaging;
StartupWMClass=equibop
Keywords=discord;equicord;equibop
END
}
