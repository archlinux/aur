# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=madedit-svn
pkgver=r589
pkgrel=5
pkgdesc="Open-Source & Cross-Platform Text/Hex Editor written in C++ and wxWidgets."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/madedit/develop"
license=('GPL')
depends=('wxgtk2.8' 'desktop-file-utils')
makedepends=('subversion' 'wxgtk2.8')
provides=('madedit')
conflicts=('madedit')
install="$pkgname.install"
PKGEXT=.pkg.tar
source=("madedit::svn://svn.code.sf.net/p/madedit/code/trunk"
        "http://downloads.sourceforge.net/project/boost/boost/1.47.0/boost_1_47_0.tar.bz2"
        madedit-highlight-blink-fix.patch
		madedit-onpaint-fix.patch
		madedit-add-file-changed-event.patch
		madedit-max-linelength-fix.patch
		madedit-desktop-file.patch)
md5sums=('SKIP'
         'a2dc343f7bc7f83f8941e47ed4a18200'
         '5e89e938d1122a5fe299a68fc583edb2'
		 '7985f66c07a1e27ee65bc01524274796'
         '661acd7e6c5f3c53177157f681335459'
         '9d9e75d6519c723e5870801d5d43bf37'
         'cdce3aba22e7106a1278a512b7f6a028')

pkgver() {
  cd "$srcdir/madedit/madedit"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "$srcdir/madedit/madedit"
  patch -p0 < "$srcdir/madedit-highlight-blink-fix.patch"
  patch -p0 < "$srcdir/madedit-onpaint-fix.patch"
  patch -p0 < "$srcdir/madedit-add-file-changed-event.patch"
  patch -p0 < "$srcdir/madedit-max-linelength-fix.patch"
  patch -p0 < "$srcdir/madedit-desktop-file.patch"
}

build() {
  cd "$srcdir/madedit/madedit"
  ./autogen.sh
  ./configure LIBS=-lX11 --prefix=/usr --with-boost="$srcdir/boost_1_47_0/" \
  --with-wx-config="wx-config-2.8"
  make
}

package() {
  cd "$srcdir/madedit/madedit"
  make DESTDIR="$pkgdir/" install
}
