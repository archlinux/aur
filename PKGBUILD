# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=scribus-indigo-git
pkgver=r56.e0da8fc
pkgrel=1
pkgdesc="A desktop publishing program - indigo fork"
arch=('i686' 'x86_64')
depends=('hunspell' 'podofo' 'python2' 'libcups' 'graphicsmagick'
	 'poppler' 'libcdr' 'libvisio' 'libpagemaker'
	 'qt5-declarative' 'libmspub' 'openscenegraph')
url="https://github.com/nitramr/scribus-indigo/wiki"
license=('GPL' 'LGPL')
makedepends=('git' 'cmake' 'qt5-tools')
provides=('scribus')
conflicts=('scribus')
source=("git+https://github.com/nitramr/scribus-indigo.git")
md5sums=('SKIP')
_gitname=scribus-indigo

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "$_gitname"/scribus/plugins/scriptplugin
  find . -type f -name "*.py" -exec sed -i '1s+python$+python2+' {} \;
}
  
build() {
  cd "$_gitname"
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_SKIP_RPATH:BOOL=YES -DWANT_GRAPHICSMAGICK=1 \
    -DCMAKE_LIBRARY_PATH=/usr/lib \
    -DCMAKE_INCLUDE_PATH=/usr/include/python2.7 \
    -DCMAKE_EXE_LINKER_FLAGS="-lQt5Quick -lQt5PrintSupport" \
    -DCMAKE_APPDATA_DIR=/usr/share/appdata \
    -DQT_PREFIX="/usr" -DWANT_CPP11=1
  make
}

package () {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 scribus.desktop $pkgdir/usr/share/applications/scribus.desktop
  install -d "${pkgdir}"/usr/share/pixmaps
  ln -s /usr/share/scribus/icons/1_5_0/scribus.png "${pkgdir}"/usr/share/pixmaps/scribus.png
}
