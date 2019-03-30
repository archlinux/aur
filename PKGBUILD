# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='mcxx'
_bundlepkgname='ompss'
pkgdesc='Mercurium is a C/C++/Fortran source-to-source compilation infrastructure aimed at fast prototyping developed by the Programming Models group at the Barcelona Supercomputing Center.'
pkgver='2.1.0'
_bundlepkgver='17.12.1'
pkgrel='3'
arch=('i686' 'x86_64')
url='https://pm.bsc.es/ompss'
license=('GPL3')
depends=(nanox python2 gcc-fortran gperf sqlite3)
makedepends=(gcc7)
source=("https://pm.bsc.es/ftp/${_bundlepkgname}/releases/${_bundlepkgname}-${_bundlepkgver}.tar.gz")
sha512sums=(e68effb54b3a4e91da22808a928afcd586d41a3825ec2cea1f783a65d4e075cfb07ce3f5a8006c5a204a46f37fc73383cd549f6706ed12124724b6be18520344)

# WORKAROUND: The sources are outdated compared to Arch's environment,
#             so we have to downgrade/disable some things...
export CC=gcc-7
export CXX=g++-7
[[ ! -z "$LDFLAGS" ]] && export LDFLAGS="$LDFLAGS,--no-as-needed"

prepare() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-$pkgver"

	# WORKAROUND: Force gperf files to be regenerated, to avoid build errors
	#             (declaration mismatches due to unsigned int / gperf_length_t)
	rm src/driver/cxx-configoptions.c
	rm src/driver/cxx-debugflags.c
	rm src/driver/cxx-fileextensions.c
	rm src/frontend/cxx-asttype-str-internal.h
	rm src/frontend/fortran/fortran03-keywords.c
}

build() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-$pkgver"

	# See https://hub.docker.com/r/bscpm/ompss/dockerfile
	./configure \
		--prefix=/usr \
		--enable-ompss \
		--with-nanox=/usr

	make
}

package() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" install
}
