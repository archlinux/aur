# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='mcxx'
_bundlepkgname='ompss'
pkgdesc='Mercurium is a C/C++/Fortran source-to-source compilation infrastructure aimed at fast prototyping developed by the Programming Models group at the Barcelona Supercomputing Center.'
pkgver='2.3.0.20190627'
_bundlepkgver='19.06'
pkgrel='2'
arch=('i686' 'x86_64')
url='https://pm.bsc.es/ompss'
license=('GPL3')
depends=(nanox gcc-fortran gperf sqlite3)
makedepends=(python3)
source=("https://pm.bsc.es/ftp/${_bundlepkgname}/releases/${_bundlepkgname}-${_bundlepkgver}.tar.gz"
        # Generated with `git format-patch -5 --stdout 2a98963e7ff28f70cf2a8bcf42a792a1420f36e3`
        # on the mcxx repository at https://github.com/bsc-pm/mcxx
        migrate_scripts_to_python3.patch)
sha512sums=(159efc17ba446f3f2205a8c0580ed10fab263f8bdb7306d5444d1fc6a592f80d749c03031e7e416090360c36a51a38da083b2b2ed4e75dda5c55a103806d91d2
            0330f65d18065ed47b9af19cc3100be7b914b720bb5858a59b89473a29ffe32c12d84da6e3c7557a2aa1b0f8bc955c17000e19302724071caa2477eefdc71af1)

# WORKAROUND: The sources are outdated compared to Arch's environment,
#             so we have to downgrade/disable some things...
[[ -n "$LDFLAGS" ]] && export LDFLAGS="$LDFLAGS,--no-as-needed"

prepare() {
	cd "$srcdir/${_bundlepkgname}-${_bundlepkgver}/$pkgname-${pkgver%.*}"

	# Backport Python 2 to 3 backports to OmpSs(1)
	patch -Np1 -i "$srcdir/migrate_scripts_to_python3.patch"
	autoreconf -fiv
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
