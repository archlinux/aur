# Maintainer: Jitang Zheng <jitang.zheng@gmail.com>

_basedir=/usr

pkgname=cpp-netlib-git
pkgver=0.12.0.final.r51.g77dc2a2
pkgrel=1
pkgdesc='The C++ Network Library Project -- cross-platform, standards compliant networking library.'
arch=('i686' 'x86_64')
url='https://github.com/cpp-netlib/cpp-netlib'
license=(Boost)
conflicts=(cpp-netlib)
provides=(cpp-netlib)
replaces=(cpp-netlib)
depends=(openssl boost boost-libs)
makedepends=(git cmake clang doxygen gtest gmock)
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
	  -DBOOST_ROOT=$_basedir \
	  -DCMAKE_C_COMPILER=clang \
	  -DCMAKE_CXX_COMPILER=clang++ \
	  -DCPP-NETLIB_BUILD_TESTS=OFF \
	  -DCPP-NETLIB_BUILD_EXAMPLES=OFF \
	  -DBUILD_GMOCK=OFF \
	  -DUri_BUILD_TESTS=OFF \
	  -DCPP-NETLIB_BUILD_SHARED_LIBS=ON \
	  -DCMAKE_INSTALL_PREFIX=$pkgdir$_basedir ../cpp-netlib
  make 
}

check() {
  cd cpp-netlib-build
  #make check
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
