# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=amide-hg
pkgver=1.0.6.r109.7b8fc8a59fd2
pkgrel=1
pkgdesc="Medical Imaging Data Examiner - mercurial checkout"
url="http://amide.sourceforge.net/packages.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('dcmtk' 'xmedcon' 'libgnomecanvas' 'gnome-vfs' 'ffmpeg' 'gsl' 'volpack')
makedepends=('gnome-doc-utils' 'gtk-doc' 'intltool' 'mercurial')
conflicts=('amide')
provides=('amide')
source=(amide::hg+http://hg.code.sf.net/p/amide/code)
md5sums=('SKIP')
options=('!makeflags')

pkgver() {
  cd ${pkgname%-hg}/${pkgname%-hg}-current
  printf "1.0.6.r%s.%s" "$(hg identify -n| tr -d +)" "$(hg identify -i| tr -d +)"
}

prepare() {
  cd ${pkgname%-hg}/${pkgname%-hg}-current
  sed -i "s+aclocal-1.14+aclocal-1.15+" Makefile.am
  sed -i "s+automake-1.14+automake-1.15+" Makefile.am
}

build() {
  cd ${pkgname%-hg}/${pkgname%-hg}-current
  autoreconf
  ./configure --prefix=/usr --enable-ffmpeg --enable-libvolpack \
	      --enable-libdcmdata --with-xmedcon-exec-prefix=/usr/bin
  make
}

package() {
  cd ${pkgname%-hg}/${pkgname%-hg}-current
  make DESTDIR="$pkgdir" install
  sed -i 's+.png++' "$pkgdir"/usr/share/applications/amide.desktop
}
