# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=scribus-indigo-git
pkgver=r108.13622cd
pkgrel=2
pkgdesc="A desktop publishing program - indigo fork"
arch=('i686' 'x86_64')
depends=('hunspell' 'podofo' 'python2' 'libcups' 'graphicsmagick' 'hicolor-icon-theme'
	 'poppler' 'libcdr' 'libvisio' 'libpagemaker' 'harfbuzz-icu' 'qt5-declarative'
	 'libmspub' 'openscenegraph' 'qt5-svg')
url="https://github.com/nitramr/scribus-indigo/wiki"
license=('GPL' 'LGPL')
makedepends=('git' 'cmake' 'qt5-tools' 'dos2unix')
provides=('scribus')
conflicts=('scribus')
source=("git+https://github.com/nitramr/scribus-indigo.git" icu_fix.patch)
md5sums=('SKIP'
         '90b5e597dc5723a659048b288a6680b0')
_gitname=scribus-indigo

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "$_gitname"/scribus/plugins/scriptplugin
  dos2unix scripts/Ligatursatz.py
  find . -type f -name "*.py" -exec sed -i '1s+python$+python2+' {} \;
  cd "$srcdir"/$_gitname
  patch -Np0 < "$srcdir"/icu_fix.patch || true
}
  
build() {
  cd "$_gitname"
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_SKIP_RPATH:BOOL=YES -DWANT_GRAPHICSMAGICK:BOOL=YES \
    -DCMAKE_LIBRARY_PATH:PATH=/usr/lib \
    -DCMAKE_INCLUDE_PATH:PATH=/usr/include/python2.7 \
    -DCMAKE_EXE_LINKER_FLAGS:STRING="-lQt5Quick -lQt5PrintSupport" \
    -DCMAKE_APPDATA_DIR:PATH==/usr/share/appdata \
    -DQT_PREFIX:PATH="/usr" 
  make
}

package () {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 scribus.desktop "$pkgdir"/usr/share/applications/scribus.desktop
  install -d "$pkgdir"/usr/share/pixmaps
  ln -s /usr/share/scribus/icons/1_5_0/scribus.png "$pkgdir"/usr/share/pixmaps/scribus.png
}
