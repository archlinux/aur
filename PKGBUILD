# Maintainer: Tzu-Yu Lee <leejuyuu@gmail.com>
# Co-maintainer: RayeS <sidorovich.pasha at gmail dot com>
# Contributor: chn <g897331845@gmail.com>
# Contributor: xantares

pkgname=boost-stacktrace-backtrace
pkgver=1.88.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc='Boost.stacktrace backtrace variant'
url='https://www.boost.org/'
arch=('x86_64')
license=('custom')
depends=('boost' 'libbacktrace-git')
makedepends=('gcc')
options=('staticlibs')
provides=(libboost_stacktrace_backtrace.so)

source=("https://archives.boost.io/release/$pkgver/source/boost_$_boostver.tar.gz")
sha256sums=('3621533e820dcab1e8012afd583c0c73cf0f77694952b81352bf38c1488f9cb4')

build() {
  cd boost_$_boostver
  ./bootstrap.sh --with-toolset=gcc
  ./b2 \
    variant=release \
    debug-symbols=off \
    threading=multi \
    runtime-link=shared \
    link=shared,static \
    toolset=gcc \
    cflags="${CPPFLAGS} ${CFLAGS} -fPIC -O3" \
    cxxflags="${CPPFLAGS} ${CXXFLAGS} -std=c++14 -fPIC -O3" \
    linkflags="${LDFLAGS}" \
    --layout=system \
    --with-stacktrace
}

package() {
  cd boost_$_boostver
  install -d "${pkgdir}"/usr/lib
  install -d "${pkgdir}"/usr/lib/cmake
  cp -P stage/lib/libboost_stacktrace_backtrace.* "${pkgdir}"/usr/lib
  cp -r stage/lib/cmake/boost_stacktrace_backtrace-"${pkgver}" "${pkgdir}"/usr/lib/cmake/
}
