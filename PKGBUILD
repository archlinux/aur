pkgname=boost-stacktrace-backtrace
pkgver=1.71.0
_boostver=${pkgver//./_}
pkgrel=1
pkgdesc='Boost.stacktrace backtrace variant'
url='https://www.boost.org/'
arch=('x86_64')
license=('custom')
depends=('boost' 'libbacktrace-git')
options=('staticlibs')
provides=(libboost_stacktrace_backtrace.so)
source=("https://dl.bintray.com/boostorg/release/${pkgver}/source/boost_${_boostver}.tar.bz2")
sha256sums=('d73a8da01e8bf8c7eda40b4c84915071a8c8a0df4a6734537ddde4a8580524ee')

build() {
  cd boost_${_boostver}
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
  cd boost_${_boostver}
  install -d "${pkgdir}"/usr/lib
  cp -P stage/lib/libboost_stacktrace_backtrace.* "${pkgdir}"/usr/lib
}
