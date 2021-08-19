# maintainer: chn <g897331845@gmail.com>

pkgname=boost-stacktrace-backtrace
pkgver=1.76.0
_boostver=${pkgver//./_}
pkgrel=2
pkgdesc='Boost.stacktrace backtrace variant'
url='https://www.boost.org/'
arch=('x86_64')
license=('custom')
depends=('boost' 'libbacktrace-git')
makedepends=('gcc')
options=('staticlibs')
provides=(libboost_stacktrace_backtrace.so)

source=("https://boostorg.jfrog.io/artifactory/main/release/$pkgver/source/boost_$_boostver.tar.gz")
sha256sums=('7bd7ddceec1a1dfdcbdb3e609b60d01739c38390a5f956385a12f3122049f0ca')

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
  cp -P stage/lib/libboost_stacktrace_backtrace.* "${pkgdir}"/usr/lib
}
