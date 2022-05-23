# Maintainer: Amirul Fitri <tounghacker@gmail.com>

# maintainer's variables
_commit=f75fffcc077e5cda0bf3c87121dca103855d2be5

pkgname=frozen
pkgver=1.1.1
pkgrel=1
pkgdesc="Header-only library that provides 0 cost initialization for immutable containers, fixed-size containers, and various algorithms."
arch=('any')
url="https://github.com/serge-sans-paille/frozen"
license=('Apache')
makedepends=('git' 'cmake')
provides=("${pkgname}")
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}::git+https://github.com/serge-sans-paille/frozen.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"

  cmake -E make_directory build
  cmake -B.build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=OFF
}

pkgver() {
  cd "${pkgname}-${pkgver}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake --build .build
}

check() {
  cd "${pkgname}-${pkgver}"
  #cmake --build .build --target test
  #cmake --build .build --target benchmark
}

package() {
  cd "${pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --install .build --config Release
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
