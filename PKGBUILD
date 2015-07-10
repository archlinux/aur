# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=sxemacs-git
pkgver=22.1.15.187.ge01219e
pkgrel=1
pkgdesc="A derivation of xemacs - git checkout"
arch=('i686' 'x86_64')
url="http://www.sxemacs.org/"
license=('GPL')
depends=('libao' 'gpm' 'libtiff' 'libltdl' 'jack' 'libmad' 'desktop-file-utils' 'compface' 'libpulse' 'libxaw' 'postgresql-libs' 'libpng')
makedepends=('git' 'texinfo')
provides=('sxemacs')
conflicts=('sxemacs' 'xemacs')
source=('git+http://git.sxemacs.org/sxemacs')
md5sums=('SKIP')
install=sxemacs.install
_gitname="sxemacs"
options=('!libtool')

prepare() {
  cd "$srcdir/${_gitname}/src"
  sed -i '204,217d' sxe-utils.h
}

pkgver() {
  cd "$srcdir/${_gitname}"
  git describe --always | sed -e 's|-|.|g' -e 's|v||'
}

build() {
  cd "$srcdir/$_gitname"
  [ -d libltdl/m4 ] || mkdir -p libltdl/m4
  ./autogen.sh --force
  sed -i 2s+cl.info+cl-sxemacs.info+ info/cl.texi
  sed -i 2s+widget.info+widget-sxemacs.info+ info/widget.texi
  LIBS="$LIBS -ldl -fPIC" CFLAGS="$CFLAGS -I/usr/include/freetype2" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
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
