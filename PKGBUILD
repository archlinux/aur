# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgbase=voglperf
pkgname=('voglperf32' 'voglperf64')
pkgver=0.2
pkgrel=7
pkgdesc="benchmarking tool for OpenGL games (frame info, logs, steam support)"
arch=('x86_64' 'i686')
url="https://github.com/ValveSoftware/voglperf"
license=('custom:MIT', 'BSD')
makedepends=('cmake' 'ncurses' 'libedit')
if [ "$CARCH" = "x86_64" ]; then
	makedepends+=('gcc-multilib' 'lib32-ncurses' 'lib32-libedit')
fi
conflicts=('voglperf')
replaces=('voglperf')
source=(https://github.com/ValveSoftware/$pkgbase/archive/$pkgver.tar.gz
	multilib-libraries.patch native-libedit.patch)
sha256sums=('c91ab58aaa69d84312ce67090252f28a104952d4335595bbc728e357bf2ad545'
            'fdde9ba59e2d3ae2cf8a0225d007b15732adf271bc283366eff377e762dac66f'
            '72c2cb961df7466984bb6aab44e03a8e2793c5ba867da12bcba18842a1210c31')

prepare() {
	cd "$srcdir/$pkgbase-$pkgver"
	if [ "$CARCH" = "x86_64" ]; then
		sed -i -e 's|./libvoglperf32.so|/usr/lib32/libvoglperf.so|' \
			-e 's|./libvoglperf64.so|/usr/lib/libvoglperf.so|' \
			src/voglperfrun.cpp
	else
		# does the 32 bit version need the 64 bit library?
		# if so, this wouldn't work
		sed -i -e 's|./libvoglperf32.so|/usr/lib/libvoglperf.so|' \
			src/voglperfrun.cpp
	fi

	# use system libedit
	patch -p1 < ../multilib-libraries.patch
	patch -p1 < ../native-libedit.patch

	# ncurses provides libtinfo functionality
	# we don't split ncurses into an extra libtinfo on Arch
	# fixed in voglperf > 0.2 (8ea79efa85b8970295ae834eb2e41c00ba18df82)
	sed -i -e 's|tinfo|ncurses|g' src/CMakeLists.txt
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
		depends=('ncurses' 'libedit')
	else
		depends=('lib32-ncurses' 'lib32-libedit' 'lib32-gcc-libs')
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
	depends=('ncurses' 'libedit' 'gcc-libs-multilib')
	cd "$srcdir/$pkgbase-$pkgver/bin"
	install -D voglperfrun64 "$pkgdir/usr/bin/voglperfrun64"
	install -Dm644 libvoglperf64.so "$pkgdir/usr/lib/libvoglperf.so"

	cd "$srcdir/$pkgbase-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir/$pkgbase-$pkgver/src/webby"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/webby/LICENSE"
}
