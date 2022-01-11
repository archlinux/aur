# Maintainer: Christian Muehlhaeuser <muesli@gmail.com>
pkgname=kristall-git
pkgver=r543.6b39f24
pkgrel=1
pkgdesc="A high-quality visual cross-platform gemini browser."
arch=('x86_64')
url="https://github.com/MasterQ32/kristall"
license=('GPL3')
makedepends=('qt5-tools')
depends=('qt5-base' 'qt5-multimedia' 'openssl' 'qt5-svg')
provides=("kristall")
conflicts=("kristall")
source=($pkgname::"git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # Fix desktop launcher icon name (allow per-theme override)
  sed -i 's/net.random-projects.//' "$srcdir/$pkgname"/Kristall.desktop
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"

  install -D build/kristall "$pkgdir/usr/bin/kristall"
  install -D LICENSE "$pkgdir/usr/share/licenses/kristall/LICENSE"
  install -Dm644 Kristall.desktop "$pkgdir/usr/share/applications/kristall.desktop"
  install -D kristall-mime-info.xml "$pkgdir/usr/share/mime/packages/kristall-mime-info.xml"

  for size in 16 32 64 128; do
    install -Dm644 src/icons/kristall-$size.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/kristall.png"
  done
  install -Dm644 src/icons/kristall.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/kristall.svg"
}
