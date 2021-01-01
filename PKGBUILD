pkgname=boost-stacktrace-backtrace
pkgver=1.75.0
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
sha256sums=('953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb')

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
