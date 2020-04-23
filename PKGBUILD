# Maintainer: Fancy Zhang <springzfx@gmail.com>
# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qcef
pkgver=1.1.6
pkgrel=1
cef_binary_commit=fecf00339545d2819224333cc506d5aa22ae8008
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
sha512sums=('6d9862f05dbc1975453e4273b9e9a4df6a4514146cfb928b4dce19893098e12c269290e6ecdb66cc0522aedaf968d781c79458b7d69361727bc622b2b133f9a1'
            '310adbaef333a54c56b9b49af653b6d5c4b00952bf44036b561e4c7544af547332f758bc73d0531f51494b8e0701f6b4900bbe7dac36faca7009009c7800dd1f'
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
