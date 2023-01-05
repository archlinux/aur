# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jackson Abascal <jacksonabascal@gmail.com>

_pkgbase=transmission
_pkgname=transmission-cli
pkgname=transmission-cli-git
pkgver=4.0.0.beta.3.r2.gcc4cbff04
pkgrel=1
arch=(x86_64 armv7h)
url="http://www.transmissionbt.com/"
license=(MIT)
pkgdesc='Fast, easy, and free BitTorrent client (CLI tools, daemon and web client)'
depends=(curl libevent libsystemd miniupnpc dht libb64 libnatpmp libdeflate libpsl libutp)
makedepends=(cmake publicsuffix-list git)
conflicts=(transmission-cli)
replaces=(transmission-cli)
provides=(transmission-cli)
source=("git+https://github.com/transmission/transmission.git"
        transmission-cli.sysusers
        transmission-cli.tmpfiles
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/transmission/utfcpp#branch=post-3.2.1-transmission"
		"git+https://github.com/transmission/libutp#branch=post-3.4-transmission"
		"git+https://github.com/transmission/fmt#branch=9-x-y"
    	"git+https://github.com/transmission/fast_float.git"
    	"git+https://github.com/transmission/wide-integer.git")
sha256sums=('SKIP'
			'641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
			'1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP'
			'SKIP')

pkgver() {
	cd $_pkgbase
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgbase
	git submodule init
	git config submodule.third-party/googletest.url "$srcdir/googletest"
	git config submodule.third-party/utfcpp.url "$srcdir/utfcpp"
	git config submodule.third-party/libutp.url "$srcdir/libutp"
	git config submodule.third-party/fmt.url "$srcdir/fmt"
	git config submodule.third-party/fast_float.url "$srcdir/fast_float"
	git config submodule.third-party/wide-integer.url "$srcdir/wide-integer"

	git -c protocol.file.allow=always submodule update \
		third-party/googletest \
		third-party/utfcpp \
		third-party/libutp \
		third-party/fmt \
		third-party/fast_float \
		third-party/wide-integer
}

build() {
	cd $_pkgbase

	mkdir -p build
	cd build

	cmake .. \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		-DENABLE_CLI=ON \
		-DENABLE_GTK=OFF \
		-DENABLE_QT=OFF \
		-DENABLE_WEB=OFF \
		-DINSTALL_LIB=ON \
		-DUSE_SYSTEM_UTP=OFF \
		-DUSE_SYSTEM_DHT=ON \
		-DUSE_SYSTEM_B64=ON \
		-DUSE_SYSTEM_NATPMP=ON

	make
}

package() {
	cd $_pkgbase/build
	make DESTDIR="$pkgdir" install

	install -Dm644 ../daemon/transmission-daemon.service \
		"$pkgdir/usr/lib/systemd/system/transmission.service"
	install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

	install -Dm644 "$srcdir/$_pkgname.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/transmission.conf"
	install -Dm644 "$srcdir/$_pkgname.tmpfiles" \
		"$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}
