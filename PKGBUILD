# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Arch Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Florian Pritz <bluewind@xinu.at>

pkgname=transmission-cli-beta
_pkgname=transmission
pkgdesc='Fast, easy, and free BitTorrent client (BETA CLI tools)'
pkgver=4.1.0beta.4
_pkgver=${pkgver//beta/-beta}
_hash=rc92b42de9c
pkgrel=1
arch=(x86_64)
url="http://www.transmissionbt.com/"
license=(GPL-2.0-or-later)
makedepends=(cmake
             curl
             dht
             glibmm-2.68
             intltool
             libb64
             libdeflate
             libevent
             libnatpmp
             miniupnpc
             ninja
             npm
             systemd)
depends=(curl
         libb64
         libdeflate
         libevent
         libnatpmp
         miniupnpc
         systemd)
provides=(transmission-cli)
conflicts=(transmission-cli)
_archive="$_pkgname-$_pkgver+$_hash"
source=("https://github.com/transmission/transmission/releases/download/$_pkgver/$_archive.tar.xz"
        transmission-cli.sysusers
        transmission-cli.tmpfiles)
sha256sums=('eeed530d668b3270d9df6a318a0714eec1b6e8348102e242fc8d697a4cfc0dec'
            '641310fb0590d40e00bea1b5b9c843953ab78edf019109f276be9c6a7bdaf5b2'
            '1266032bb07e47d6bcdc7dabd74df2557cc466c33bf983a5881316a4cc098451')

build() {
	export CFLAGS+=' -ffat-lto-objects'
	cd "$_archive"

	cmake \
		-G Ninja \
		-D CMAKE_BUILD_TYPE=RelWithDebInfo \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D ENABLE_CLI=ON \
		-D ENABLE_DAEMON=ON \
		-D ENABLE_GTK=OFF \
		-D ENABLE_MAC=OFF \
		-D ENABLE_QT=OFF \
		-D REBUILD_WEB=ON \
		-D ENABLE_TESTS=ON \
		-D ENABLE_UTILS=ON \
		-D ENABLE_UTP=ON \
		-D INSTALL_LIB=ON \
		-D USE_SYSTEM_B64=ON \
		-D USE_SYSTEM_DEFLATE=ON \
		-D USE_SYSTEM_DHT=ON \
		-D USE_SYSTEM_EVENT2=ON \
		-D USE_SYSTEM_MINIUPNPC=ON \
		-D USE_SYSTEM_NATPMP=ON \
		-D USE_SYSTEM_PSL=ON \
		-D USE_SYSTEM_UTP=OFF \
		-D WITH_CRYPTO=openssl \
		-D WITH_SYSTEMD=ON \
		-S . \
		-B build
	cmake --build build --config Release
}

check() {
	cd "$_archive"
	cd build
	# Exclude test that fails on the build server
	ctest --output-on-failure -j "$(nproc)" -E LT.DhtTest.usesBootstrapFile
}

_install_component() {
	(cd $srcdir/$_archive/build; DESTDIR="$pkgdir" ninja $1/install)
}

package() {
	cd "$_archive"
	for dir in daemon cli web utils; do
		_install_component $dir
	done
	install -d "$pkgdir"/usr/share/transmission
	cp -a build/web/public_html/ "$pkgdir"/usr/share/transmission
	mv "$pkgdir/usr/lib/systemd/system/transmission-daemon.service" \
		"$pkgdir/usr/lib/systemd/system/transmission.service"
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/transmission-cli/COPYING"
	install -Dm644 "$srcdir/${_pkgname}-cli.sysusers" \
		"$pkgdir/usr/lib/sysusers.d/transmission.conf"
	install -Dm644 "$srcdir/${_pkgname}-cli.tmpfiles" \
		"$pkgdir/usr/lib/tmpfiles.d/transmission.conf"
}
