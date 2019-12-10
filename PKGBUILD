# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='mcxx'
_bundlepkgname='ompss'
pkgdesc='Mercurium is a C/C++/Fortran source-to-source compilation infrastructure aimed at fast prototyping developed by the Programming Models group at the Barcelona Supercomputing Center.'
pkgver='2.3.0.20190627'
_bundlepkgver='19.06'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://pm.bsc.es/ompss'
license=('GPL3')
depends=(nanox gcc-fortran gperf sqlite3)
makedepends=(python2)
source=("https://pm.bsc.es/ftp/${_bundlepkgname}/releases/${_bundlepkgname}-${_bundlepkgver}.tar.gz")
sha512sums=(159efc17ba446f3f2205a8c0580ed10fab263f8bdb7306d5444d1fc6a592f80d749c03031e7e416090360c36a51a38da083b2b2ed4e75dda5c55a103806d91d2)

# WORKAROUND: The sources are outdated compared to Arch's environment,
#             so we have to downgrade/disable some things...
[[ ! -z "$LDFLAGS" ]] && export LDFLAGS="$LDFLAGS,--no-as-needed"

prepare() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-${pkgver%.*}"
}

build() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-${pkgver%.*}"

	# WORKAROUND: Force gperf files to be regenerated, to avoid build errors
	#             (declaration mismatches due to unsigned int / gperf_length_t)
	rm src/driver/cxx-configoptions.c
	rm src/driver/cxx-debugflags.c
	rm src/driver/cxx-fileextensions.c
	rm src/frontend/cxx-asttype-str-internal.h
	rm src/frontend/fortran/fortran03-keywords.c

	# See https://hub.docker.com/r/bscpm/ompss/dockerfile
	./configure \
		--prefix=/usr \
		--enable-ompss \
		--with-nanox=/usr

	make
}

package() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-${pkgver%.*}"

	make DESTDIR="$pkgdir/" install
}
