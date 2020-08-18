# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Dan Beste <dan.ray.beste@gmail.com>

pkgname=ngs-lang
pkgver=0.2.8
pkgrel=1
pkgdesc='Next Generation Shell (NGS)'
arch=('x86_64')
url='https://github.com/ngs-lang/ngs'
provides=('ngs')
license=('GPL3')
depends=('json-c'
         'gc'
         'libffi'
         'pcre')
makedepends=('cmake'
             'git'
             'pandoc'
             'peg'
             'uthash')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('469d0286b506ef06fe30359e1e85e316090ec2f5e5d78eebe7ae1d76d5f660c9')

prepare() {
  cd "${pkgname/-lang}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
}

build() {
  cd "${pkgname/-lang}-${pkgver}/build"
  make
}

check() {
  cd "${pkgname/-lang}-${pkgver}/build"
  ctest
}

package() {
  cd "${pkgname/-lang}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  cd "${pkgdir}/usr"
  install -d share
  rm -rf doc
  mv man share/
  find "${pkgdir}/usr/bin" -type f -exec chmod o-w {} +
}
# vim: ts=2 sw=2 et: