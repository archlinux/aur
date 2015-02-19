# Contributor: Johannes Dewender  arch at JonnyJD dot net
pkgname=voglperf
pkgver=0.2
pkgrel=3
pkgdesc="benchmarking tool for OpenGL games (frame info, logs, steam support)"
arch=('x86_64' 'i686')
url="https://github.com/ValveSoftware/voglperf"
license=('custom:MIT', 'BSD')
depends=('ncurses' 'gcc-libs-multilib')
if [ "$CARCH" = "x86_64" ]; then
	depends+=('lib32-ncurses')
fi
makedepends=('cmake' 'gcc-multilib')
source=(https://github.com/ValveSoftware/$pkgname/archive/$pkgver.tar.gz)
sha256sums=('c91ab58aaa69d84312ce67090252f28a104952d4335595bbc728e357bf2ad545')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i -e 's|./libvoglperf32.so|/usr/lib32/libvoglperf.so|' \
		-e 's|./libvoglperf64|/usr/lib/libvoglperf.so|' \
		src/voglperfrun.cpp
	# ncurses provides libtinfo functionality
	# we don't split ncurses into an extra libtinfo on Arch
	sed -i -e 's|tinfo|ncurses|' src/CMakeLists.txt
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	if [ "$CARCH" = "x86_64" ]; then
		make voglperf64 voglperf32
	else
		make voglperf32
	fi
}

package() {
	cd "$srcdir/$pkgname-$pkgver/bin"
	install -D voglperfrun32 "$pkgdir/usr/bin/voglperfrun32"
	install -Dm644 libvoglperf32.so "$pkgdir/usr/lib32/libvoglperf.so"
	if [ "$CARCH" = "x86_64" ]; then
		install -D voglperfrun64 "$pkgdir/usr/bin/voglperfrun64"
		install -Dm644 libvoglperf64.so "$pkgdir/usr/lib/libvoglperf.so"
		ln -s "/usr/bin/voglperfrun64" "$pkgdir/usr/bin/voglperfrun"
	else
		ln -s "/usr/bin/voglperfrun32" "$pkgdir/usr/bin/voglperfrun"
	fi

	cd "$srcdir/$pkgname-$pkgver"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "$srcdir/$pkgname-$pkgver/src/webby"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/webby/LICENSE"
}
