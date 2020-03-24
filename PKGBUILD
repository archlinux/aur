# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sxemacs-git
pkgver=22.1.16.42.g65bafef
pkgrel=1
pkgdesc="A derivation of xemacs - git checkout"
arch=('i686' 'x86_64')
url="http://www.sxemacs.org/"
license=('GPL')
depends=('libao' 'gpm' 'libtiff' 'jack' 'libmad' 'desktop-file-utils'
	 'compface' 'libpulse' 'libxaw' 'sox' 'openssl' 'ffmpeg' 'xaw3d')
makedepends=('git' 'texinfo' 'xbitmaps')
provides=('sxemacs')
conflicts=('sxemacs' 'xemacs')
source=('git+http://git.sxemacs.org/sxemacs')
md5sums=('SKIP')
_gitname="sxemacs"
options=('!libtool' '!makeflags')

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --tags | sed -e 's|-|.|g' -e 's|v||'
}

prepare() {
  cd "$srcdir/${_gitname}/etc"
  sed -i 's+StartupWMClass=Emacs+StartupWMClass=SXEmacs+' sxemacs.desktop.in
}

build() {
  cd "$srcdir"
  [ -d ${_gitname}/libltdl/m4 ] || mkdir -p ${_gitname}/libltdl/m4
  [ -d build ] || mkdir -p build
  cd build
  ../${_gitname}/autogen.sh 
  LIBS="$LIBS -ldl -fPIC" CFLAGS="$CFLAGS -I/usr/include/freetype2" \
      ../${_gitname}/configure --prefix=/usr --with-openssl
  make
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir/" install
# remove conflict with ctags package
  mv "$pkgdir"/usr/bin/{ctags,ctags.sxemacs}
  mv "$pkgdir"/usr/share/man/man1/{ctags.1,ctags.sxemacs.1}
# remove conflict with other emacsen
  mv "$pkgdir"/usr/bin/{etags,etags.sxemacs}
  mv "$pkgdir"/usr/share/man/man1/{etags.1,etags.sxemacs.1}
  mv "$pkgdir"/usr/share/info/cl.info \
    "$pkgdir"/usr/share/info/cl-sxemacs.info
  mv "$pkgdir"/usr/share/info/widget.info \
    "$pkgdir"/usr/share/info/widget-sxemacs.info
}
