# Maintainer: Tim Schneeberger (thepbone) <tim.schneeberger(at)outlook.de>
pkgname=ddctoolbox-git
pkgver=2.0.1.r29.g1988c7b
pkgrel=1
epoch=2
pkgdesc="Create and edit DDC headset correction files"
arch=('x86_64')
url="https://github.com/ThePBone/DDCToolbox"
license=('GPL3')
depends=('qt5-base')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ThePBone/DDCToolbox.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i 's|Icon=${SNAP}/meta/gui/ddctoolbox.svg|Icon=ddctoolbox|g' \
    "snap/gui/${pkgname%-git}.desktop"
  sed -i 's|Type=Application |Type=Application|g' "snap/gui/${pkgname%-git}.desktop"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  qmake-qt5 DDCToolbox.pro "CONFIG += no_tests"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 src/DDCToolbox "$pkgdir/usr/bin/${pkgname%-git}"
  install -Dm644 "snap/gui/${pkgname%-git}.desktop" -t "$pkgdir/usr/share/applications/"
  install -Dm644 "snap/gui/${pkgname%-git}.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
}
