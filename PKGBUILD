# Maintainer: Troy C < rstrox -ta yahoo -tod com >
# Contributor: Marek Skrobacki <skrobul@skrobul.com>
# Contributor: Alasdair Haswell <ali at arhaswell dot co dot uk>

pkgname=meanwhile
pkgver=1.0.2
pkgrel=9
pkgdesc="Meanwhile libraries"
arch=('i686' 'x86_64')
license=('GPL')
depends=('glib2')
conflicts=('meanwhile-svn')
source=(http://downloads.sourceforge.net/sourceforge/meanwhile/$pkgname-$pkgver.tar.gz
	broken-status.patch
	fix_glib_includes.patch
	fix_groupchat.patch)
sha256sums=('38a8059eaa549cbcb45ca0a5b453e9608ceadab360db2ae14581fb22ddabdf23'
            '9a60e2ca35d902d5dd9647254a20099ceb399a025f1b04c2676f90ffe2d276f0'
            'c3dc0e423f7f4ceee65e4c08c1daebee23c61c608b970185074d118ed0199c47'
	    '90467c648c18086a3f7989b7bab8f21eb44631c19a7d531121e927a0a1e74e9c')


build() {
  cd $srcdir/$pkgname-$pkgver/src
  patch -Np0 -i "${srcdir}/broken-status.patch"
  patch -Np2 -i "${srcdir}/fix_glib_includes.patch"
  patch -Np2 -i "${srcdir}/fix_groupchat.patch"

  cd $srcdir/$pkgname-$pkgver

  CFLAGS="-mtune=generic -pipe -fstack-protector --param=ssp-buffer-size=4"
  CXXFLAGS="${CFLAGS}"
  export CFLAGS CXXFLAGS

  ./configure --prefix=/usr --disable-doxygen --disable-mailme
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
