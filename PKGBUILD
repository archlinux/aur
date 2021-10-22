# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=sxemacs-git
pkgver=22.1.17.4.g66cd362
pkgrel=2
pkgdesc="A derivation of xemacs - git checkout"
arch=('i686' 'x86_64')
url="http://www.sxemacs.org/"
license=('GPL')
depends=('libao' 'gpm' 'libtiff' 'jack' 'libmad' 'desktop-file-utils' 
	 'compface' 'libpulse' 'libxaw' 'sox' 'openssl' 'ffmpeg' 'xaw3d'
	 'postgresql-libs')
# dependency postgresql-libs can be avoided using --with-postgres=no in configure statement
makedepends=('git' 'texinfo' 'xbitmaps')
provides=('sxemacs')
conflicts=('sxemacs' 'xemacs')
source=('git+http://git.sxemacs.org/sxemacs')
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | sed -e 's|-|.|g' -e 's|v||'
}

prepare() {
  cd ${pkgname%-git}/etc
  sed -i 's+StartupWMClass=Emacs+StartupWMClass=SXEmacs+' sxemacs.desktop.in
  cd ../..
  [ -d ${pkgname%-git}/libltdl/m4 ] || mkdir -p ${pkgname%-git}/libltdl/m4
  [ -d build ] || mkdir -p build
}

build() {
  cd build
  ../${pkgname%-git}/autogen.sh 
  CFLAGS="$CFLAGS -I/usr/include/freetype2" \
	../${pkgname%-git}/configure --prefix=/usr --with-openssl --with-athena=3d \
	--without-database
  make
}

package() {
  cd "build"
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
