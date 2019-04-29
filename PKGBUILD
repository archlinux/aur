# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='mcxx'
_bundlepkgname='ompss'
pkgdesc='Mercurium is a C/C++/Fortran source-to-source compilation infrastructure aimed at fast prototyping developed by the Programming Models group at the Barcelona Supercomputing Center.'
pkgver='2.1.0'
_bundlepkgver='17.12.1'
pkgrel='6'
arch=('i686' 'x86_64')
url='https://pm.bsc.es/ompss'
license=('GPL3')
depends=(nanox gcc-fortran gperf sqlite3)
makedepends=(python2)
source=("https://pm.bsc.es/ftp/${_bundlepkgname}/releases/${_bundlepkgname}-${_bundlepkgver}.tar.gz"
        "https://github.com/bsc-pm/mcxx/commit/26fb7dffbaa06a5389acb1138717b14ce7d350a1.patch"
        "https://github.com/bsc-pm/mcxx/commit/0f2c80f40f1e452fd450aef20838667eef801475.patch"
        "https://github.com/bsc-pm/mcxx/commit/862ad57617772802ad6a804a1f5ecf470ca00ddc.patch")
sha512sums=(e68effb54b3a4e91da22808a928afcd586d41a3825ec2cea1f783a65d4e075cfb07ce3f5a8006c5a204a46f37fc73383cd549f6706ed12124724b6be18520344
            1de58ecc762c8e6d79e9daf0718a5f1bd96c929effa6962ddd411dc0794061d6d35fc520f2889588b33d5edbdf70c9d0ac5d3800fa669f09a031ec3e55ef5eb6
            c2fd4647a96de3287d1b15d2ab31d99dfa73c12e7e74a77b4ca6857e7106a0431462055feb570436a4957883bd085a2f0199f046b53a682b984b38862eaa1491
            ef42c42495717a0c06e6fedf17e2c02904b20f59fd19f114a6d407913f924c340ebbec721252048c394a705bae39234e8c9346e584317ef6356111ae149724c3)

# WORKAROUND: The sources are outdated compared to Arch's environment,
#             so we have to downgrade/disable some things...
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

	# WORKAROUND: Those patches are necessary to avoid a _float128 / _Float128 clash
	#             (due to Arch being more cutting-edge than usual)
	#             You can test this by building examples in (e.g. 02-beginners/matmul):
	#             https://github.com/bsc-pm/ompss-ee
	patch -p1 < "$srcdir/26fb7dffbaa06a5389acb1138717b14ce7d350a1.patch"
	patch -p1 < "$srcdir/0f2c80f40f1e452fd450aef20838667eef801475.patch"

	# WORKAROUND: Needed to build in GCC8 (but was unnecessary in GCC7)
	patch -p1 < "$srcdir/862ad57617772802ad6a804a1f5ecf470ca00ddc.patch"
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
