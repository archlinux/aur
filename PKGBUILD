# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgbase=voglperf
pkgname=('voglperf32' 'voglperf64')
pkgver=0.2
pkgrel=5
pkgdesc="benchmarking tool for OpenGL games (frame info, logs, steam support)"
arch=('x86_64' 'i686')
url="https://github.com/ValveSoftware/voglperf"
license=('custom:MIT', 'BSD')
depends=('ncurses')
makedepends=('cmake')
if [ "$CARCH" = "x86_64" ]; then
	makedepends+=('gcc-multilib' 'lib32-ncurses')
fi
conflicts=('voglperf')
replaces=('voglperf')
source=(https://github.com/ValveSoftware/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('c91ab58aaa69d84312ce67090252f28a104952d4335595bbc728e357bf2ad545')

prepare() {
	cd "$srcdir/$pkgbase-$pkgver"
	if [ "$CARCH" = "x86_64" ]; then
		sed -i -e 's|./libvoglperf32.so|/usr/lib32/libvoglperf.so|' \
			-e 's|./libvoglperf64|/usr/lib/libvoglperf.so|' \
			src/voglperfrun.cpp
	else
		# does the 32 bit version need the 64 bit library?
		# if so, this wouldn't work
		sed -i -e 's|./libvoglperf32.so|/usr/lib/libvoglperf.so|' \
			src/voglperfrun.cpp
	fi
	# ncurses provides libtinfo functionality
	# we don't split ncurses into an extra libtinfo on Arch
	# fixed in voglperf > 0.2 (8ea79efa85b8970295ae834eb2e41c00ba18df82)
	sed -i -e 's|tinfo|ncurses|' src/CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgbase-$pkgver"
	if [ "$CARCH" = "x86_64" ]; then
		make voglperf64 voglperf32
	else
		make voglperf32
	fi
}

package_voglperf32() {
	arch=('x86_64' 'i686')
	if [ "$CARCH" = "i686" ]; then
		depends=('ncurses')
	else
		depends=('lib32-ncurses' 'lib32-gcc-libs')
	fi
	cd "$srcdir/$pkgbase-$pkgver/bin"
	install -D voglperfrun32 "$pkgdir/usr/bin/voglperfrun32"
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm644 libvoglperf32.so \
			"$pkgdir/usr/lib32/libvoglperf.so"
	else
		install -Dm644 libvoglperf32.so \
			"$pkgdir/usr/lib/libvoglperf.so"
	fi

	cd "$srcdir/$pkgbase-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir/$pkgbase-$pkgver/src/webby"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/webby/LICENSE"
}

package_voglperf64() {
	arch=('x86_64')
	depends=('ncurses' 'gcc-libs-multilib')
	cd "$srcdir/$pkgbase-$pkgver/bin"
	install -D voglperfrun64 "$pkgdir/usr/bin/voglperfrun64"
	install -Dm644 libvoglperf64.so "$pkgdir/usr/lib/libvoglperf.so"

	cd "$srcdir/$pkgbase-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir/$pkgbase-$pkgver/src/webby"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/webby/LICENSE"
}
