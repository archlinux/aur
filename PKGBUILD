# Maintainer: László Várady <laszlo.varady93@gmail.com>
# Contributor: Snaipe

pkgname=criterion
pkgver=2.3.3
pkgrel=3
pkgdesc="A cross-platform C and C++ unit testing framework for the 21th century"
arch=('x86_64')
url="https://github.com/Snaipe/Criterion"
license=('MIT')
depends=('gettext' 'nanomsg' 'libcsptr')
makedepends=('cmake')
checkdepends=('python-cram')
source=("https://github.com/Snaipe/Criterion/releases/download/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        'do-not-specify-gdb-hostname.patch')
sha256sums=('8c85e1fcdb9a39b82bee50394bedfe74a0c839ffff129ddfc6fb73b11adafa29'
            'e150fdccfbe97359db380352cd66f6eb0bbddc98c2adfac2159334ba36a17dd2')

prepare() {
  cd "${pkgname}-v${pkgver}/dependencies/boxfort"

  # temporary fix for https://github.com/Snaipe/Criterion/issues/301
  patch --forward --strip=1 --input="${srcdir}/do-not-specify-gdb-hostname.patch"
}

build() {
  cd "${pkgname}-v${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr -DCTESTS=ON -S . -B build
  cmake --build build
}

check() {
  cd "${pkgname}-v${pkgver}"
  cmake --build build --target criterion_tests test
}

package() {
  cd "${pkgname}-v${pkgver}"
  cmake --build build --target install -- DESTDIR="$pkgdir/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
