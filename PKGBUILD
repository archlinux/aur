# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>

pkgname=scribus1.5.1
pkgver=preview
pkgrel=4
pkgdesc="A desktop publishing program - version 1.5.1 preview"
arch=('x86_64')
url="http://www.scribus.net"
license=('custom')
conflicts=('scribus1.5')
depends=('boost' 'hunspell' 'podofo' 'python2' 'libcups' 'graphicsmagick' 'lib2geom'
	 'shared-mime-info' 'poppler' 'libcdr' 'desktop-file-utils'
	 'libvisio' 'libpagemaker' 'qt5-declarative')
makedepends=('cmake' 'qt5-tools')
optdepends=('libmspub: Microsoft Publisher file format parser library' 'libwpg: Library for importing and converting Corel WordPerfect(tm) Graphics images' 'openscenegraph: An Open Source, high performance real-time graphics toolkit')
source=('https://sourceforge.net/projects/scribus/files/scribus-devel/1.5.1/scribus-1.5.1.tar.xz' 'scribus1.5.desktop')
sha256sums=('1882e68713d91c2ab9d6ec7a251dbbe31a4438ee68e63e62d36770541e6f4a38' 'SKIP')
install=${pkgname}.install


prepare() {
  cd "$srcdir"/scribus-1.5.1/scribus/plugins/scriptplugin
  find . -type f -name "*.py" -exec sed -i '1s+python$+python2+' {} \;
}

build() {
  cd "$srcdir"/scribus-1.5.1
  cmake . -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DCMAKE_SKIP_RPATH:BOOL=YES -DWANT_GRAPHICSMAGICK=1 \
    -DCMAKE_INCLUDE_PATH=/usr/include/python2.7 \
    -DCMAKE_EXE_LINKER_FLAGS="-lQt5Quick -lQt5PrintSupport" \
    -DQT_PREFIX="/usr" 
  make
}

package () {
  install -Dm644 scribus1.5.desktop \
	  "$pkgdir"/opt/share/applications/$pkgname.desktop
  cd "$srcdir"/scribus-1.5.1
  make DESTDIR="$pkgdir" install
    install -Dm644 COPYING "$pkgdir"/opt/share/licenses/$pkgname/COPYING
}
