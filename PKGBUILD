# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
pkgname='folding'
pkgdesc='Combined instrumentation and sampling for instantaneous metric evolution with low overhead (from BSC).'
pkgver='1.4.2.20250211'
pkgrel='2'
arch=('x86_64')
url='https://www.bsc.es/discover-bsc/organisation/scientific-structure/performance-tools'
license=('LGPL-2.1-or-later')
depends=(boost qt5-base libbsctools r clang python)
makedepends=(gcc-fortran)
source=("https://ftp.tools.bsc.es/$pkgname/$pkgname-${pkgver%.*}-src.tar.bz2"
        python3-ports.patch)
sha512sums=(6cfcf562cc056d7135c42313640ff63432096c725dab34f79ea6e13a929ab60b6b1cf2075248a8b49c9218d59709d314155ada179221d136c13a1f1df7c8cd17
            f62af324cfe585605dbdfdb87fa7877cb794ba854c1445193710f22ce3cb92effcfcb7c6b8e32286f927bd0804478580b6358b62f15cba789359862bc0589aa1)

prepare() {
	cd "$srcdir/$pkgname-${pkgver%.*}"

	# WORKAROUND: The configure/make scripts check if a static version (.a) of the libbsctools libraries
	#             are installed, and fails to detect libbsctools if they aren't.
	#             Since we're going to link against the dynamic version (.so) as is typical in Arch,
	#             hack it up to check for the dynamic version consistently instead
	sed -i 's/\.a/.so/g' config/libbsctools.m4

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
