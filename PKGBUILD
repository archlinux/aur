# Maintainer: Franco Brigiotti <fbrigio@gmail.com>

pkgname=cash-register
pkgver=0.1
pkgrel=1
pkgdesc="Cash register application with Qt6 interface"
arch=('x86_64')
url="https://github.com/Brigio/cash-register"
license=('GPL3')

depends=(
  'qt6-base'
  'hicolor-icon-theme'
)

makedepends=(
  'cmake'
  'ninja'
  'qt6-tools'
)

source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/Brigio/cash-register/archive/v$pkgver.tar.gz"
)

sha256sums=('5d87bbc8f5a4ad4f730b721b2ddfd43f359f674bbd783251fe3aa114ff75f68f')

build() {
  cd "$pkgname-$pkgver"

  cmake -S . -B build \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  cd "$pkgname-$pkgver"

  DESTDIR="$pkgdir" cmake --install build

  # Desktop file
  install -Dm644 cash-register.desktop \
    "$pkgdir/usr/share/applications/cash-register.desktop"

  # Icons (hicolor)
  find icons/hicolor -type f -name "*.png" -exec \
    install -Dm644 "{}" "$pkgdir/usr/share/icons/{}" \;

  # AppStream metadata
  install -Dm644 cash-register.metainfo.xml \
    "$pkgdir/usr/share/metainfo/cash-register.metainfo.xml"
}
