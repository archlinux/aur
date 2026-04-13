# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname="cellframe-wallet"
pkgver=4.6.118
pkgrel=1
pkgdesc="Official Cellframe Wallet"
arch=(x86_64 aarch64)
url="https://cellframe.net"
license=(GPL-3.0-or-later)
depends=(qt6-declarative qt6-base qt6-svg qt6-5compat)
makedepends=(git cmake libxslt)
optdepends=('cellframe-node: Support for local node management')
options=(!debug)
source=(git+https://gitlab.demlabs.net/cellframe/${pkgname}.git#commit=6176e61cd651dae36e84899b05f10cafaaa01063
        $pkgname-tmpfiles.conf)
provides=("cellframe-wallet")
install=$pkgname.install
sha256sums=('SKIP'
            '234159e616751b8f1f76001e0f305ef6e5ba6121adfe8cc6a583618b96227d35')

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
