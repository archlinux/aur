# Maintainer: Sebastiaan Lokhorst <sebastiaanlokhorst@gmail.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jackson Abascal <jacksonabascal@gmail.com>

_pkgbase=transmission
_pkgname=transmission-cli
pkgname=transmission-cli-git
pkgver=4.0.3.r160.g8169d524e
pkgrel=1
arch=(x86_64 armv7h)
url="https://www.transmissionbt.com/"
license=(GPL)
pkgdesc='Fast, easy, and free BitTorrent client (CLI tools and daemon - without web client) - git version'
depends=(
	curl
	dht
	libb64
	libdeflate
	libevent
	libnatpmp
	libpsl
	libsystemd
	miniupnpc
)
makedepends=(
	cmake
	git
	ninja
)
conflicts=("$_pkgname")
provides=("$_pkgname")
options=(!lto)
source=("git+https://github.com/transmission/transmission.git"
	transmission-cli.sysusers
	transmission-cli.tmpfiles)
sha256sums=('SKIP'
			'641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
			'1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

pkgver() {
	cd $_pkgbase
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd $_pkgbase
	git submodule init
	git -c protocol.file.allow=always submodule update \
		third-party/fast_float \
		third-party/fmt \
		third-party/googletest \
		third-party/libutp \
		third-party/small \
		third-party/utfcpp \
		third-party/wide-integer
}

build() {
	cd $_pkgbase

    CFLAGS+=" -ffat-lto-objects"

	cmake -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
		-DENABLE_CLI=ON \
        -DENABLE_DAEMON=ON \
		-DENABLE_GTK=OFF \
        -DENABLE_MAC=OFF \
        -DENABLE_NLS=OFF \
		-DENABLE_QT=OFF \
        -DENABLE_TESTS=OFF \
        -DENABLE_UTILS=ON \
        -DENABLE_UTP=ON \
        -DINSTALL_LIB=OFF \
        -DINSTALL_WEB=OFF \
		-DREBUILD_WEB=OFF \
        -DUSE_SYSTEM_B64=ON \
        -DUSE_SYSTEM_DEFLATE=ON \
        -DUSE_SYSTEM_DHT=ON \
        -DUSE_SYSTEM_EVENT2=ON \
        -DUSE_SYSTEM_MINIUPNPC=ON \
        -DUSE_SYSTEM_NATPMP=ON \
        -DUSE_SYSTEM_PSL=ON \
        -DUSE_SYSTEM_UTP=OFF \
        -DWITH_APPINDICATOR=OFF \
        -DWITH_CRYPTO=openssl \
        -DWITH_INOTIFY=OFF \
        -DWITH_KQUEUE=OFF \
        -S . -B build
}

package() {
	cd $_pkgbase/build
	env DESTDIR="$pkgdir" ninja install

	install -Dm644 ../daemon/transmission-daemon.service \
		"$pkgdir/usr/lib/systemd/system/transmission.service"
	install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"

	install -Dm644 "$srcdir/$_pkgname.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/transmission.conf"
	install -Dm644 "$srcdir/$_pkgname.tmpfiles" \
		"$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}

