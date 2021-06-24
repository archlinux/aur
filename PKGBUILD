# Maintainer:  ForMat <2934301923[AT]qq.com>
# Maintainer: ForMat <2934301923[AT]qq.com>

pkgname=qcef
pkgver=1.1.8
pkgrel=1
cef_binary_commit=059a0c9cef4e289a50dc7a2f4c91fe69db95035e
pkgdesc="Qt5 binding of CEF"
arch=('x86_64')
url="https://github.com/linuxdeepin/qcef"
license=('GPL')
depends=('gconf' 'gtk2' 'libxss' 'nss' 'libpulse' 'qt5-webchannel' 'qt5-x11extras')
makedepends=('cmake' 'qt5-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/linuxdeepin/qcef/archive/$pkgver.tar.gz"
		"cef-binary-${cef_binary_commit}.zip::https://github.com/linuxdeepin/cef-binary/archive/${cef_binary_commit}.zip"
		"remove_Werror.patch"
		"chrome-sandbox_override.patch")
        # "cef-$_cefcommit.tar.gz::https://github.com/linuxdeepin/cef-binary/archive/$_cefcommit.tar.gz"
        # http://opensource.spotify.com/cefbuilds/cef_binary_${_cefver}_linux64_minimal.tar.bz2
        # https://raw.githubusercontent.com/cztomczak/cefpython/master/patches/issue231.patch)
sha512sums=('72a3a0ca4ef655407e583469f2d55ac38bd6e829e8f9ee270df794a724f192667a97796cb9825a8b08c82810d486091cd504d0387561a3a08615a1e0b2cdfcbd'
            '42c39f7f764f46ed1420d73d5d170fe8ab13b55b939e4a1a60e10c8c8d7fdb31dd381656196546ae404af02066b0c0bd013a34f4d81f44d8dc44881d73b11a6c'
            '7450ae7c33d847c5d82560f5d32508c605b7e593b3aff7418aecd836859c002d177eee081260d3e816cf89ce043b20a17d87fc17569667b0ddc7a2da696c9472'
            '34a3d83abc573d13fd11c85aa85b0ec7dfb9117b297395773996d38f9cda3314561ccbbecbe0312ebe70dfb641a66c124c3d5e9afbdf40ba0487db5cad9bc406')

prepare() {
  rm -rf qcef-$pkgver/cef
  mv cef-binary-${cef_binary_commit} qcef-$pkgver/cef
  patch qcef-$pkgver/cef/cmake/cef_variables.cmake < remove_Werror.patch
  patch qcef-$pkgver/src/CMakeLists.txt < chrome-sandbox_override.patch
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../qcef-$pkgver
  make -j12
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
} 
