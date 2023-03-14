# Maintainer: Kamui
pkgname=gazou-git
pkgver=0.3.0
pkgrel=1
pkgdesc="A Japanese and Chinese OCR application for linux"
arch=("i686" "x86_64")
url="https://github.com/kamui-fin/gazou"
license=('GPL')
depends=("tesseract" "leptonica" "qt5-base" "qt5-x11extras")
makedepends=("cmake" "pkg-config" "git")
source=("$pkgname::git+https://github.com/kamui-fin/gazou.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  mkdir build
  git submodule update --init
}

build() {
  cd "${pkgname}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DGUI=ON
  cmake --build .
}

package() {
  cmake --build "${pkgname}/build" --target install -- DESTDIR="${pkgdir}"
  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
