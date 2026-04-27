# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname="cellframe-wallet"
pkgver=4.6.123
pkgrel=1
pkgdesc="Official Cellframe Wallet"
arch=(x86_64 aarch64)
url="https://cellframe.net"
license=(GPL-3.0-or-later)
depends=(qt6-declarative qt6-base qt6-svg qt6-5compat)
makedepends=(git cmake libxslt)
optdepends=('cellframe-node: Support for local node management')
options=(!debug)
source=(git+https://gitlab.demlabs.net/cellframe/${pkgname}.git#commit=e08753b8b938e561c30506d03dd2c75f0a2b5301
        $pkgname-tmpfiles.conf)
provides=("cellframe-wallet")
install=$pkgname.install
sha256sums=('SKIP'
            '067aa7c1c738347d3d9e046cdb773671e74dc89888bcf65d55aba8eb7877c745')

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive --progress
}

build() {
	find "$srcdir/$pkgname" -name 'OS_Detection.cmake' -exec \
		sed -i '/add_compile_options(-Werror)/d' {} +
	cd "$srcdir/$pkgname"
	cmake -B build \
		-DDAP_MANAGE_CFLAGS=OFF \
		-DCELLFRAME_NO_OPTIMIZATION=OFF \
		-DWALLET_TEST_ENABLED=OFF
	cmake --build build
}

package() {
	install -Dm755 "$srcdir/$pkgname/build/Cellframe-Wallet" "$pkgdir/usr/local/bin/Cellframe-Wallet"
	install -Dm644 "$srcdir/$pkgname/os/debian/share/CellframeWallet.png" "$pkgdir/usr/share/pixmaps/CellframeWallet.png"
	install -Dm644 "$srcdir/$pkgname/os/debian/share/CellFrameWallet.desktop" "$pkgdir/usr/share/applications/CellFrameWallet.desktop"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
