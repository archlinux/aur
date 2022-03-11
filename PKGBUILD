# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: peippo <christoph+aur@christophfink.com>
pkgname=protozero
pkgver=1.7.1
pkgrel=3
pkgdesc="Minimalist protocol buffer decoder and encoder in C++"
url="https://github.com/mapbox/protozero"
arch=('any')
license=('custom')
makedepends=('clang' 'cmake' 'cppcheck' 'include-what-you-use')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mapbox/${pkgname}/archive/v${pkgver}.tar.gz")

build() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"

  # clang++ is strict with mixing C++11 and C++17 features,
  # fails to build test,
  # see https://aur.archlinux.org/packages/protozero#comment-855739
  if [[ "${CXX}" == "clang++" ]]; then
    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DIWYU_TOOL=/usr/bin/iwyu-tool \
      -DBUILD_TESTING=OFF \
      -DCLANG_TIDY=OFF \
      ..
  else
    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DIWYU_TOOL=/usr/bin/iwyu-tool \
      ..
  fi

  make
}

check() {
  if [[ "${CXX}" != "clang++" ]]; then
    cd "${srcdir}/${pkgname}-${pkgver}/build"
    make test
  fi
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  install -Dm644 ../LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha256sums=('27e0017d5b3ba06d646a3ec6391d5ccc8500db821be480aefd2e4ddc3de5ff99')
