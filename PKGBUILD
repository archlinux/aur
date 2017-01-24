# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=amide-hg
pkgver=1.0.6r109.7b8fc8a59fd2
pkgrel=2
pkgdesc="Medical Imaging Data Examiner - mercurial checkout"
url="http://amide.sourceforge.net/packages.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dcmtk-git' 'xmedcon' 'libgnomecanvas' 'ffmpeg' 'gsl' 'gnome-vfs')
optdepends=('volpack: for volume rendering')
makedepends=('gnome-doc-utils' 'gtk-doc' 'intltool')
conflicts=('amide')
provides=('amide')
source=(amide::hg+http://hg.code.sf.net/p/amide/code)
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd "$srcdir"/${pkgname%-hg}/${pkgname%-hg}-current
  printf "1.0.6r%s.%s" "$(hg identify -n| tr -d +)" "$(hg identify -i| tr -d +)"
}

prepare() {
  cd "$srcdir"/${pkgname%-hg}/${pkgname%-hg}-current
  sed -i "s+aclocal-1.14+aclocal-1.15+" Makefile.am
  sed -i "s+automake-1.14+automake-1.15+" Makefile.am
}

build() {
  cd "$srcdir"/${pkgname%-hg}/${pkgname%-hg}-current
  autoreconf
   ./configure --prefix=/usr --enable-ffmpeg --enable-libvolpack --enable-libdcmdata --with-xmedcon-exec-prefix=/usr/bin
  make
}

package() {
  cd "$srcdir"/${pkgname%-hg}/${pkgname%-hg}-current
  make DESTDIR=$pkgdir install
  sed -i 's+.png++' $pkgdir/usr/share/applications/amide.desktop
}
