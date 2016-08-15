# Maintainer: Jitang Zheng <jitang.zheng@gmail.com>

_basedir=/usr

pkgname=cpp-netlib-git
pkgver=0.12.0.final.r51.g77dc2a2
pkgrel=2
pkgdesc='The C++ Network Library Project -- cross-platform, standards compliant networking library.'
arch=('i686' 'x86_64')
url='https://github.com/cpp-netlib/cpp-netlib'
license=(Boost)
conflicts=(cpp-netlib)
provides=(cpp-netlib)
replaces=(cpp-netlib)
depends=(boost-libs)
makedepends=(git cmake clang boost openssl)
source=(git+https://github.com/cpp-netlib/cpp-netlib.git)
md5sums=(SKIP)

pkgver() {
  cd cpp-netlib
  git describe --long --tags | sed 's/cpp-netlib-//' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  [ -d cpp-netlib-build ] && rm -r cpp-netlib-build
  cd cpp-netlib
  git submodule init
  git submodule update
}


build() {
  mkdir cpp-netlib-build
  cd cpp-netlib-build
  cmake -DCMAKE_BUILD_TYPE=Release \
	  -DBUILD_SHARED_LIBS=ON \
	  -DCMAKE_C_COMPILER=clang \
	  -DCMAKE_CXX_COMPILER=clang++ \
	  -DCPP-NETLIB_ENABLE_HTTPS=ON \
	  -DCPP-NETLIB_BUILD_EXAMPLES=OFF \
	  -DCPP-NETLIB_BUILD_TESTS=OFF \
	  -DCPP-NETLIB_BUILD_DOCS=OFF \
	  -DUri_BUILD_TESTS=OFF \
  	  -DUri_BUILD_DOCS=OFF \
	  -DCMAKE_CXX_FLAGS="-std=c++11 ${CMAKE_CXX_FLAGS}" \
	  -DCMAKE_INSTALL_PREFIX=$pkgdir$_basedir ../cpp-netlib

  make 
  cd deps/uri
  make install

}

check() {
  cd cpp-netlib-build
  make test
}

package() {
  cd cpp-netlib-build
  make install

  install -d ${pkgdir}${_basedir}/lib
  if test "$CARCH" == x86_64; then
    mv ${pkgdir}${_basedir}/lib64/* ${pkgdir}${_basedir}/lib
    rmdir ${pkgdir}${_basedir}/lib64
  fi
  #for _file in $(find ${pkgdir}${_basedir}/lib/cmake/cppnetlib -type f -name "*.cmake");
  #do
  #  sed -i -e "s|${pkgdir}${_basedir}/lib64|${_basedir}/lib|g" $_file
  #  sed -i -e "s|${pkgdir}${_basedir}|${_basedir}|g" $_file
  #done


  #Install license
  install -d ${pkgdir}/usr/share/licenses/cpp-netlib
  cd "$srcdir/cpp-netlib"
  install -Dm644 LICENSE_1_0.txt ${pkgdir}/usr/share/licenses/cpp-netlib/LICENSE_1_0.txt
}
