# Maintainer: Mauro Santos <registo.mailling@gmail.com>

pkgname=madedit-svn
pkgver=r589
pkgrel=6
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
sha256sums=('SKIP'
            '815a5d9faac4dbd523fbcf3fe1065e443c0bbf43427c44aa423422c6ec4c2e31'
            'dd83851552b501026d2f6d0c271276e52fcfc403f4d755dee5c67f85b5a3dddf'
            '7c69d771a0d1f82d96d8d82f5496cabf14cc619c143a3581bc31c182cee2a3bd'
            '4cfe63f9647344fb025861d461b2b569f7190a34abe63718223ddf580cfed1e3'
            '8a85d47515e9259ffebdac9f9f28214c9abd8e4b162e0e4bfac03ea5c8aab589'
            '37af5a79f0ab9cde84778bfb511cab3b3fd170d4c2683905a22e07c9f939ab92')

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
