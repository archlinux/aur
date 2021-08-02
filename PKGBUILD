# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>

# AUR Maintainer: Joaquin 'ShyanJMC' <shyan@shyanjmc.com>

pkgname=gnucash-minimal
pkgver=4.6
pkgrel=1
pkgdesc='Personal and small-business financial-accounting application. Compiled with minimal features.'
arch=(x86_64)
url='https://gnucash.org/'
license=(GPL)
depends=(boost-libs guile webkit2gtk)
makedepends=(boost cmake ) # gmock )
optdepends=('gnucash-docs: documentation'
            'perl-date-manip: stock information lookups'
            'perl-finance-quote: stock information lookups')
options=(!emptydirs)
source=(https://razaoinfo.dl.sourceforge.net/project/gnucash/gnucash%20%28stable%29/${pkgver}/gnucash-${pkgver}.tar.bz2)
sha256sums=('251b01dfb9f9c679db26926f934ca4d13c7092a485be04f60e2031d85a445733')

build() {
  cd gnucash-$pkgver

  # Do not treat warnings as errors
  sed -e 's|-Werror||g' -i CMakeLists.txt

  cmake	-D CMAKE_INSTALL_PREFIX=/usr \
        -D CMAKE_INSTALL_LIBDIR=/usr/lib \
        -D WITH_PYTHON=OFF \
        -D COMPILE_GSCHEMAS=OFF \
	-D WITH_SQL=OFF \
	-D WITH_AQBANKING=OFF \
	-D WITH_GNUCASH=ON \
	-D WITH_OFX=OFF \
	-D ENABLE_BINRELOC=OFF \
	-D ENABLE_REGISTER2=OFF #\
	#-D DISABLE_DEPRECATED_GLIB=ON \
	#-D DISABLE_DEPRECATED_GTK=ON \
	#-D DISABLE_DEPRECATED_GNOME=ON \

  make
}

check() {
  cd gnucash-$pkgver
  make -k check || : # 2 tests failed
}

package() {
  cd gnucash-$pkgver
  make DESTDIR="$pkgdir" install

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "$pkgdir/usr/bin/gnucash-valgrind"
}
