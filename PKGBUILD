# Maintainer: FrozenCow <frozencow@gmail.com>

pkgname=itch
pkgver=0.12.0
pkgrel=1
pkgdesc="The best way to play itch.io games."

arch=('i686' 'x86_64')
url="https://github.com/itchio/itch"
license=('MIT')

depends=('alsa-lib' 'libnotify' 'nss' 'gconf' 'gtk2' 'libxtst' 'desktop-file-utils' 'gtk-update-icon-cache' 'p7zip')
makedepends=('nodejs-babel-cli' 'sassc' 'electron' 'nodejs' 'nodejs-grunt-cli' 'npm')
options=('!strip')
install="itch.install"

source=("https://github.com/itchio/itch/archive/v${pkgver}.tar.gz")
sha256sums=('95def5b7a23209c0a5695f40aeaa3e0b208a0a6009131c2f3995c5cf9613553e')

[ "$CARCH" = "i686" ]   && _ELECTRON_ARCH=ia32
[ "$CARCH" = "x86_64" ] && _ELECTRON_ARCH=x64

prepare() {
  cd "itch-${pkgver}"

  export PYTHON=/usr/bin/python2

  # Get dependencies
  npm install
}

build() {
  cd "$srcdir/itch-${pkgver}"
  release/prepare.sh
  release/generate-itch-desktop.sh

  grunt -v "electron:linux-${_ELECTRON_ARCH}"
}

check() {
  cd "$srcdir/itch-${pkgver}"
  npm test
}

package() {
  cd "$srcdir/itch-$pkgver"

  install -d "$pkgdir/opt/itch"
  cp -a "build/v$pkgver/itch-linux-$_ELECTRON_ARCH/." "${pkgdir}/opt/itch"

  install -d "$pkgdir/usr/share/applications"
  install -Dm644 release/itch.desktop "${pkgdir}/usr/share/applications/itch.desktop"

  for icon in release/icons/icon*.png
  do
    iconsize="${icon#release/icons/icon}"
    iconsize="${iconsize%.png}"
    icondir="$pkgdir/usr/share/icons/hicolor/${iconsize}x${iconsize}/apps/"
    install -d "${icondir}"
    install -Dm644 "$icon" "$icondir/itch.png"
  done

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm755 "release/itch.sh" "${pkgdir}/usr/bin/itch"
}
