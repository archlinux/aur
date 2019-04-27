# Maintainer: James P. Harvey <jamespharvey20 at gmail dot com>

pkgname=boost-di-git
_pkgname="${pkgname%-git}"
provides=('boost-di')
conflicts=('boost-di')
pkgver=1.0.1.r418.g388364952
pkgrel=1
pkgdesc="Boost (experimental) c++14 dependency injection library (developmental version)"
arch=('any')
url="https://github.com/boost-experimental/di"
license=('Boost')
makedepends=('git' 'cmake')
source=("${_pkgname}::git+https://github.com/boost-experimental/di")
sha256sums=('SKIP')

pkgver() {
   cd "${srcdir}/${_pkgname}"
   git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
   cd "${srcdir}/${_pkgname}"
   cmake .
   make
}

check() {
   cd "${srcdir}/${_pkgname}"
   # let user know this test isn't hung, because it will take around a minute even though tons of prior tests were nearly instant
   sleep 3 && echo && echo "*** test.ft_di_errors will take at least a minute ***" &
   ctest
}

package() {
   cd "${srcdir}/${_pkgname}/include/boost"
   install -Dm644 di.hpp "${pkgdir}/usr/include/${_pkgname}/di.hpp"
   cp -r di "${pkgdir}/usr/include/${_pkgname}"
}
