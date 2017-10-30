# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=tufao
pkgver=1.4.4
pkgrel=2
pkgdesc="An asynchronous web framework for C++ built on top of Qt"
arch=('i686' 'x86_64')
url="https://github.com/vinipsmaker/tufao"
license=('LGPL2')
depends=('qt5-base')
makedepends=('cmake')
source=("${pkgname}::git+https://github.com/vinipsmaker/tufao.git#tag=${pkgver}"
        "boost.http::git+https://github.com/BoostGSoC14/boost.http.git#commit=0a02eab2aedb743ad96f0aa9aa0d570e58dc7e41")
md5sums=('SKIP' 'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.boost.http.url "${srcdir}/boost.http"
  git submodule update
}

build() {
  mkdir -p "${srcdir}/${pkgname}/build"
  cd "${srcdir}/${pkgname}/build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TESTS=ON ..
  make
}

check() {
  cd "${srcdir}/${pkgname}/build"
  make tests

  # Uncomment the following line to help Tufão development by sending info
  # about build status
  #make Experimental
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR="$pkgdir" install
}
