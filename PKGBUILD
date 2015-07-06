# Contributor: Zhu Jinxuan <zhujinxuan@gmail.com>
# Maintainer: Zhu Jinxuan <zhujinxuan@gmail.com>
# This PKGBUILD is also available in https://github.com/zhujinxuan/PKGBUILDs

pkgname=utopia-documents
pkgver=2.4.4
pkgrel=1
pkgdesc="PDF reader that displays interactive annotations on scientific articles. "
arch=('i686' 'x86_64')
url='http://utopiadocs.cs.man.ac.uk'
license=('GPL')
depends=('libqglviewer-qt4' 'python2' 'boost' 'boost-libs' 'pcre' 'ttf-ms-fonts' 'qt4' 'qjson' 'liblxqt-git'
          'python2-pillow'
          'python2-lxml'
          'python2-cssselect'
          'python2-suds')
makedepends=( 'raptor1' 'swig' 'cmake' 'glew')
optdepends=()
provides=('utopia-documents')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://utopiadocs.cs.man.ac.uk/files/${pkgname}-${pkgver}.zip" "configure.patch" "GlobalParams.cc.patch"
          "utopia-documents.sh" "utopia-documents.bash" "utopia-documents.zsh" 
          "utils.cpp.patch" )
sha256sums=('80bcf57a6e1b53586e1a62137a0c4a74c411fc49fef2f9b9bfa9f8e9e8ecbc64' '4c2b62839d22e26ee8e069416b30d8c2dde35ec72fc8b3e8851df2a763495b43' 'b0cfa242c63e192e1099e83ea8e23430469bb8d9bb2a07f3ca3d336c78b8dcca'
          '9e4c9f9aee0b3bfa9625989f3de4de5032f7b656b5f6f050d206d1541e30d41a'
          '64524d3a3be66f403db44ef40772717aff38445e0e4208c15ac166fe2fcfad0a'
          '64524d3a3be66f403db44ef40772717aff38445e0e4208c15ac166fe2fcfad0a'
          '79e60cae2d746a2c323e328a4a2d6e6ef02ca5a2d2f244b6ccbd3229580d95d9'
)

build() {
  export Automoc4_DIR=/usr/lib/automoc4
  # unzip "${pkgname}-${pkgver}".zip
  cd "${pkgname}-${pkgver}"
  cp ../configure.patch ./
  # cp ../GlobalParams.cc.patch  libcrackle/crackle/libxpdf/
  patch libcrackle/crackle/libxpdf/GlobalParams.cc ../GlobalParams.cc.patch
  patch libambrosia/ambrosia/utils.cpp ../utils.cpp.patch
  patch configure configure.patch
  ./configure --release
  cd build/Linux-Release
  cp CMakeCache.txt CMakeCache.txt.1
  sed -i 's|CMAKE_INSTALL_PREFIX:PATH=\/usr|CMAKE_INSTALL_PREFIX:PATH=XXXX|g' CMakeCache.txt.1
  sed -i "s|XXXX|$pkgdir/usr|g"  CMakeCache.txt.1
  cp CMakeCache.txt.1 CMakeCache.txt
  make 
}

package() {
  mkdir ${pkgdir}/etc/profile.d/ -p
  install utopia-documents.bash --target-directory=${pkgdir}/etc/profile.d/
  install utopia-documents.sh --target-directory=${pkgdir}/etc/profile.d/
  install utopia-documents.zsh --target-directory=${pkgdir}/etc/profile.d/
  cd "${pkgname}-${pkgver}"
  cd build/Linux-Release
  make install 
  
} 
