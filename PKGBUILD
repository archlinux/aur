# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='folding'
pkgdesc='Combined instrumentation and sampling for instantaneous metric evolution with low overhead (from BSC).'
pkgver='1.4.0.20221214'
pkgrel='1'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('GPL3')
depends=(boost qt5-base libbsctools r clang python)
makedepends=(gcc-fortran)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        python3-ports.patch)
sha512sums=(9cc3b9863eb6916924adbf62165e131c42c2ab2920d2f1e2bd4ac701d48ca2c2169d0e4b17bdae8ba0f91be584d97a607c62c86f488ae6a44ba0a62ac20d360a
            f62af324cfe585605dbdfdb87fa7877cb794ba854c1445193710f22ce3cb92effcfcb7c6b8e32286f927bd0804478580b6358b62f15cba789359862bc0589aa1)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: The configure/make scripts check if static version (.a) of the libbsctools libraries
	#             are installed, and fail to detect libbsctools if they aren't.
	#             Since even if we're going to link against the dynamic version (.so) as is typical in Arch,
	#             hack it up to check for the dynamic version consistently instead
	sed -i 's/\.a/.so/g' config/libbsctools.m4

	# WORKAROUND: Any this dependency is missing in the automake scripts,
	# so the make process breaks when running the autoreconf, so add it again
	echo 'kriger_test_DEPENDENCIES = libkriger.la' >> 'src/interpolate/service-kriger/Makefile.am'

	autoreconf -i -f -I config

	# WORKAROUND: Fix some scripts that still only work with Python 2
	patch -Np1 -i "$srcdir/python3-ports.patch"
}

build() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# NOTE: The following optional features are NOT enabled:
	# * LaTeX documentation
	./configure \
		--prefix=/usr \
		--with-libbsctools=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	make prefix="$pkgdir/usr/" install

	# FIXME: Why are those libraries from libbsctools copied to the package directory when installing?
	rm "${pkgdir}/usr/lib/libparavertraceconfig.so"
	rm "${pkgdir}/usr/lib/libparavertraceparser.so"
}
