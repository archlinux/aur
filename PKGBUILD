# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Joël Schaerer <joel.schaerer at laposte.net>
# Contributor: Ľubomir 'The_K' Kučera <lubomir.kucera.jr at gmail.com>
# Contributor: Robert Schwarz <mail@rschwarz.net>
# Contributor: Johannes Schlatow <johannes.schlatow@googlemail.com>
# Contributor: Stephan Friedrichs <deduktionstheorem@googlemail.com>

pkgname=scipoptsuite
pkgver=7.0.0
pkgrel=1
pkgdesc='Toolbox for generating and solving optimization problems (with Parallel Processing)'
arch=('x86_64')
url='https://scip.zib.de'
license=('LGPL-3.0' 'ZIB Academic License')
replaces=('ziboptsuite')
depends=('gmp' 'readline' 'zlib' 'gmp' 'cppad' 'bliss')
makedepends=('ninja' 'cmake' "${depends[@]}" 'boost' 'bliss')
optdepends=('coin-or-ipopt: COIN-OR Interior Point Optimizer IPOPT'
            'gsl: GNU Scientific Library'
            'cliquer: C routines for finding cliques in an arbitrary weighted graph'
            'hmetis: A set of programs for partitioning hypergraphs'
            'criterion: A cross-platform C and C++ unit testing framework')
provides=('scip=7.0.0' 'soplex=5.0.0' 'zimpl=3.3.9')
source=("local:///${pkgname}-${pkgver}.tgz")
md5sums=('eb86857ee047bd40ee1b7bdfc3587672')
options=('strip')

prepare() {
  mkdir -p "${srcdir}/${pkgname}-${pkgver}/build"
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  cmake -G Ninja -DCMAKE_INSTALL_PREFIX=/usr -DTPI=tny ..
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  ninja
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  ninja check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/build"
  DESTDIR="${pkgdir}" ninja install
  install -D -m644 ../COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  sed -i "180s|${srcdir}/${pkgname}-${pkgver}/build/zimpl/src/|usr/include|" ${pkgdir}/usr/include/zimpl/mmlparse2.h
  sed -i "6s|${srcdir}||" ${pkgdir}/usr/lib/cmake/gcg/gcg-config.cmake
}
# vim:set ts=2 sw=2 et: