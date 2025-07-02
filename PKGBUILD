# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname="cellframe-wallet"
pkgver=4.0.76
pkgrel=1
pkgdesc="Official Cellframe Wallet"
arch=(x86_64 aarch64)
url="https://cellframe.net"
license=(GPL-3.0-or-later)
depends=(qt6-declarative qt6-base qt6-svg qt6-5compat)
makedepends=(git cmake libxslt)
optdepends=('cellframe-node: Support for local node management')
options=(!debug)
source=("git+https://gitlab.demlabs.net/cellframe/${pkgname}.git#tag=v.4.0-76"
        "$pkgname-tmpfiles.conf")
md5sums=('SKIP'
         '8744d1d0af5e1456bfce710a4c36af64')
provides=("cellframe-wallet")
install=$pkgname.install

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive --progress
}

build() {
	cd "$srcdir/$pkgname"
	cmake -B build -DCMAKE_BUILD_TYPE=None
	cmake --build build
}

package() {
	install -Dm755 "$srcdir/$pkgname/build/Cellframe-Wallet" "$pkgdir/usr/local/bin/Cellframe-Wallet"
	install -Dm644 "$srcdir/$pkgname/os/debian/share/CellframeWallet.png" "$pkgdir/usr/share/pixmaps/CellframeWallet.png"
	install -Dm644 "$srcdir/$pkgname/os/debian/share/CellFrameWallet.desktop" "$pkgdir/usr/share/applications/CellFrameWallet.desktop"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
