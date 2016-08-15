# Maintainer: Jitang Zheng <jitang.zheng@gmail.com>

pkgname=cpp-netlib-uri-git
pkgver=60c0da3
pkgrel=1
pkgdesc='cpp-netlib URI'
arch=(i686 x86_64)
url='https://github.com/cpp-netlib/uri'
license=(BOOST)
conflicts=(cpp-netlib-uri)
provides=(cpp-netlib-uri)
replaces=(cpp-netlib-uri)
depends=()
makedepends=(git cmake clang)
source=(git+https://github.com/cpp-netlib/uri.git)
md5sums=(SKIP)

pkgver() {
  cd uri
  git rev-parse --short HEAD
}

prepare() {
  [ -d uri-build ] && rm -r uri-build
  cd uri
  git submodule init
  git submodule update
}

build() {
  mkdir uri-build
  cd uri-build
  cmake -DCMAKE_BUILD_TYPE=Release \
  	-DCMAKE_C_COMPILER=clang \
	-DCMAKE_CXX_COMPILER=clang++ \
	-DUri_BUILD_TESTS=OFF \
  	-DUri_BUILD_DOCS=OFF \
	-DUri_DISABLE_LIBCXX=ON \
  	-DCMAKE_INSTALL_PREFIX=$pkgdir/usr ../uri
  make
}

check() {
  cd uri-build
  #make check
}

package() {
  cd uri-build
  make install

  #mkdir ${pkgdir}/usr/include/network
  mv ${pkgdir}/usr/include/include/network ${pkgdir}/usr/include
  rmdir ${pkgdir}/usr/include/include
}
