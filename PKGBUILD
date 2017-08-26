# Maintainer: rvasilev <2rvasilev@live.ru>
# Contributor: Zhu Jinxuan <zhujinxuan@gmail.com>
# Contributor: tdy tdy@archlinux.info

pkgname=utopia-documents3
pkgver=3.1.0
pkgrel=1
pkgdesc="PDF reader that displays interactive annotations on scientific articles"
arch=(i686 x86_64)
url=http://utopiadocs.com
license=(GPL)
provides=('utopia-documents3')
conflicts=('utopia-documents')
depends=(python boost-libs glu hicolor-icon-theme pcre qt5-svg qt5-webkit qt5-script poppler-qt5 python2-pyqt5)
makedepends=(cmake boost swig glew)
source=("http://utopiadocs.com/files/utopia-documents-${pkgver}.tgz" 
         "configure.patch"
         "bubble.patch"
         "utopia-documents.sh" 
         "utopia-documents.bash" 
         "utopia-documents.zsh")
sha256sums=('e6db50a16d2ae53ce051217e6941c5796bf5b9d517b0623ab6ff0b617b04f365'
            '808a26f259768507e864d729191b8dd85a6472f43d9c1f507dd775dd1eaedcc2'
            '9e4c9f9aee0b3bfa9625989f3de4de5032f7b656b5f6f050d206d1541e30d41a'
            '64524d3a3be66f403db44ef40772717aff38445e0e4208c15ac166fe2fcfad0a'
            '64524d3a3be66f403db44ef40772717aff38445e0e4208c15ac166fe2fcfad0a')

prepare() {
PATCH="${srcdir}/configure.patch"

cd utopia-documents-$pkgver

patch configure $PATCH
patch libutopia2_qt/utopia2/qt/bubble.h ${srcdir}/bubble.patch

./configure --release

cd build/Linux-Release
cp CMakeCache.txt CMakeCache.txt.1
sed -i 's|CMAKE_INSTALL_PREFIX:PATH=\/usr|CMAKE_INSTALL_PREFIX:PATH=XXXX|g' CMakeCache.txt.1
sed -i "s|XXXX|$pkgdir/usr|g"  CMakeCache.txt.1
cp CMakeCache.txt.1 CMakeCache.txt

}

build() {
  cd utopia-documents-$pkgver/build/Linux-Release
  make -j4
}

package() {
  mkdir ${pkgdir}/etc/profile.d/ -p
  install utopia-documents.bash --target-directory=${pkgdir}/etc/profile.d/
  install utopia-documents.sh --target-directory=${pkgdir}/etc/profile.d/
  install utopia-documents.zsh --target-directory=${pkgdir}/etc/profile.d/
  
  cd utopia-documents-$pkgver/build/Linux-Release
  make install
}
sha256sums=('e6db50a16d2ae53ce051217e6941c5796bf5b9d517b0623ab6ff0b617b04f365'
            '808a26f259768507e864d729191b8dd85a6472f43d9c1f507dd775dd1eaedcc2'
            '407aefc4b150be472a12f4a293bf3ac44918affa18cc78e684aba2f9a1a62f71'
            '9e4c9f9aee0b3bfa9625989f3de4de5032f7b656b5f6f050d206d1541e30d41a'
            '64524d3a3be66f403db44ef40772717aff38445e0e4208c15ac166fe2fcfad0a'
            '64524d3a3be66f403db44ef40772717aff38445e0e4208c15ac166fe2fcfad0a')
