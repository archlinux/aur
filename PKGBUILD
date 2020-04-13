# Maintainer: Félix Saparelli <felix @ passcod.name>

pkgname=plv8
pkgver=2.3.14
pkgrel=3
pkgdesc="V8 Engine Javascript Procedural Language add-on for PostgreSQL"
url="https://github.com/plv8/plv8"
arch=('x86_64' 'i686')
license=('PLV8JS License: https://raw.githubusercontent.com/plv8/plv8/master/COPYRIGHT')
depends=(
  'postgresql>=9.2'
  'readline'
  'ncurses5-compat-libs'
)
makedepends=(
  'clang'
  'clang-tools-extra'
  'ninja'
  'python2'
  'python2-virtualenv'
)
source=("https://github.com/plv8/plv8/archive/v${pkgver}.tar.gz")
sha512sums=('8f8b1ddbc4554fb52125b96e54b0befbd22a75ee3138309b34b63180f8a943fd427fea9477bc04b2d267e0c11ac01d30bfb9c35e0f8c2b6fac56f50aa41090a7')

build() {
  cd "plv8-${pkgver}"
  ln -sf $(which python2) python
  here="$(pwd)"
  depot="${srcdir}/plv8-${pkgver}/build/depot_tools"
  make -j $(nproc) static PATH="${here}:${depot}:${PATH}"
}

package() {
  extdir="${pkgdir}/usr/share/postgresql/extension/"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${pkgdir}/usr/lib/postgresql"}"/plv8.so"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plv8.control"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plv8--${pkgver}.sql"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plcoffee.control"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plcoffee--${pkgver}.sql"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plls.control"
  install -Dm655 {"${srcdir}/plv8-${pkgver}","${extdir}"}"/plls--${pkgver}.sql"
}
