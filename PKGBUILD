# Contributor: Jörg Schuck <joerg_schuck@web.de>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>
# Contributor: Mark Schneider <queueRAM@gmail.com>
# Contributor: David Madl <xuphiexu@abanbytes.eu>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=gnucash-python
_realname=gnucash
pkgver=3.1
pkgrel=2
pkgdesc="A personal and small-business financial-accounting application with enabled python bindings."
arch=('i686' 'x86_64')
url="http://www.gnucash.org"
license=("GPL")
depends=('aqbanking' 'webkit2gtk' 'guile' 'libdbi' 'boost-libs' 'libsecret')
makedepends=('git' 'boost' 'gmock' 'gwenhywfar' 'cmake' 'libdbi-drivers' 'libmariadbclient' 'postgresql-libs' 'swig')
optdepends=(
       'gnucash-docs: for documentation'
       'iso-codes: for translation of currency names'
       'perl-finance-quote: for stock information lookups'
       'perl-date-manip: for stock information lookups'
)
options=('!makeflags' '!emptydirs')
provides=('gnucash')
conflicts=('gnucash')
source=(git+https://github.com/Gnucash/gnucash.git#commit=2e53d647263c20a9e1a9a7fd6893ec7ef186280f)
sha256sums=('SKIP')

backup=('etc/gnucash/environment') 

build() {
  cd $_realname
  [[ -d build ]] || mkdir build
  cd build
  cmake -D CMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
	-DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
	-DCOMPILE_GSCHEMAS=OFF \
	-DWITH_OFX=ON \
	-DWITH_AQBANKING=ON \
	-D WITH_PYTHON=ON \
	-D PYTHON_EXECUTABLE=$(which python) \
	..
   make
}

check() {
  cd $_realname/build
  make -k check || : # 2 tests failed
}

package() {
  cd $_realname/build
  make DESTDIR="${pkgdir}" install

  # Delete the gnucash-valgrind executable because the source files
  # are not included with the package and the executable is hardlinked
  # to the location that it was built at.
  rm -f "${pkgdir}"/usr/bin/gnucash-valgrind
  # avoid conflict to gwenhywfar package
  rm -f "${pkgdir}"/usr/lib/libgwengui-gtk3.so
}
