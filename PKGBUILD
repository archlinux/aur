pkgname=qemu-guest-agent-windows
pkgver=2.10.0
pkgrel=1
pkgdesc="qemu-ga"
pkgurl=http://wiki.qemu.org/
license=(GPL2 LGPL2.1)
depends=()
arch=(any)
makedepends=(python2 mingw-w64-glib2 msitools)
source=(
	https://download.qemu.org/qemu-$pkgver.tar.xz
	mingw-ga.patch
	# http://www.microsoft.com/en-us/download/details.aspx?id=23490 # need to download manually and extract this with wine??
)

ARCHS=(i686 x86_64)
ARCHS_GA=(i386 x86_64)

prepare() {
	cd $srcdir/qemu-$pkgver
	patch -p1 < $srcdir/mingw-ga.patch
}

build() {
	cd $srcdir/qemu-$pkgver

	for arch in "${ARCHS[@]}"; do
		# can't use -mingw32-configure :(
		LDFLAGS=
		mingw_c_flags="-O2 -g -pipe -Wall -Wp,-D_FORTIFY_SOURCE=2 -fexceptions --param=ssp-buffer-size=4"
		export CFLAGS="$mingw_c_flags"
		export CXXFLAGS="$mingw_c_flags"
		./configure \
			--disable-system --disable-user \
			--enable-guest-agent --enable-guest-agent-msi \
			--python=$(which python2) \
			--cross-prefix=$arch-w64-mingw32-
			# --with-vss-sdk=$PATH_TO_SDK
		make msi
	done
}

package() {
	installdir=/usr/share/qemu/
	install -d $pkgdir$installdir

	for arch in "${ARCHS_GA[@]}"; do
		install -m 0644 $srcdir/qemu-$pkgver/qemu-ga-$arch.msi $pkgdir$installdir
	done
}

# makepkg -g >> PKGBUILD
md5sums=('a89e3293cf69c32cf4be4188dfa25544'
         '2e16b8e07ed9c82df1a568d311133def')
