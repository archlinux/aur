# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='folding'
pkgdesc='Combined instrumentation and sampling for instantaneous metric evolution with low overhead (from BSC).'
pkgver='1.3.2'
pkgrel='5'
arch=('i686' 'x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('GPL3')
depends=(boost qt5-base libbsctools r clang)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-$pkgver-src.tar.bz2")
sha512sums=(df54700a1eee506f7b7b8d08f74805d576d1455fe3e31de368d0a98bd3bc7114eef4c32d73462ac9cab2f5a9f273c27cc8538e9cfbf9b044c8ef66d3881a7f3d)

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	# WORKAROUND: The configure/make scripts check if static version (.a) of the libbsctools libraries
	#             are installed, and fail to detect libbsctools if they aren't.
	#             Since even if we're going to link against the dynamic version (.so) as is typical in Arch,
	#             hack it up to check for the dynamic version consistently instead
	sed -i 's/\.a/.so/g' config/libbsctools.m4

	# WORKAROUND: Any this dependency is missing in the automake scripts,
	# so the make process breaks when running the autoreconf, so add it again
	echo 'kriger_test_DEPENDENCIES = libkriger.la' >> 'src/interpolate/service-kriger/Makefile.am'

	autoreconf -i -f -I config
}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# NOTE: The following optional features are NOT enabled:
	# * LaTeX documentation
	./configure \
		--prefix=/usr \
		--with-libbsctools=/usr

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	make prefix="$pkgdir/usr/" install

	# FIXME: Why are those libraries from libbsctools copied to the package directory when installing?
	rm "${pkgdir}/usr/lib/libparavertraceconfig.so"
	rm "${pkgdir}/usr/lib/libparavertraceparser.so"
}