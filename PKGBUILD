# Maintainer: Alexandru Barbur <alex@ctrlc.name>
pkgname=sockpp
pkgver=0.7.1
pkgrel=2
pkgdesc="Simple, modern, C++ socket library."
arch=(arm armv6h armv7h aarch64 x86_64 i686)
url="https://github.com/fpagliughi/sockpp"
license=('BSD-3')
depends=()
makedepends=('cmake' 'doxygen' 'catch2')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")

source=(
    "https://github.com/fpagliughi/sockpp/archive/refs/tags/v${pkgver}.tar.gz"
    'disable-latex-docs.patch'
    'docs-install-path.patch')

sha256sums=(
    '2e023528bebbd2ac083fc91fbe6d5c4158c3336bedbcff48f594f3b28f53b940'
    '65827b4280a318527d830e0655c2ee7a6172cb7d7349a7a58dd3ac8251ef6f29'
    '1f534e51b88e512b84414fb8510d9c9ce25d6011c63d2d9a9d950661b3c74f64')


prepare() {
  patch --directory "${pkgname}-${pkgver}" --forward --strip=1 --input="${srcdir}/disable-latex-docs.patch"
  patch --directory "${pkgname}-${pkgver}" --forward --strip=1 --input="${srcdir}/docs-install-path.patch"
  cmake -B build -S "${pkgname}-${pkgver}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSOCKPP_BUILD_SHARED=ON \
        -DSOCKPP_BUILD_STATIC=ON \
        -DSOCKPP_BUILD_DOCUMENTATION=ON \
        -DSOCKPP_BUILD_TESTS=ON
}

build() {
  cd "${srcdir}/build"
  make
}

check() {
  cd "${srcdir}/build"
  ./tests/unit/unit_tests
}

package() {
  cd "${srcdir}/build"
  DESTDIR=${pkgdir} make install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
