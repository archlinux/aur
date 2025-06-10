# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname="cellframe-wallet"
pkgver=4.0.41
pkgrel=1
pkgdesc="Official Cellframe Wallet"
arch=(x86_64 aarch64)
url="https://cellframe.net"
license=(GPL-3.0-or-later)
depends=(qt6-declarative qt6-base qt6-svg qt6-5compat)
makedepends=(git cmake libxslt)
optdepends=('cellframe-node: Support for local node management')
options=(!debug)
source=("git+https://gitlab.demlabs.net/cellframe/${pkgname}.git#commit=51a7b2d945ff6eb86d566b3cccb2244ee4a6366e"
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

_gen_desktop_file() {
	cat > "$pkgdir/usr/share/applications/CellframeWallet.desktop" <<EOF
[Desktop Entry]
Name=Cellframe Wallet
Exec=/usr/bin/cellframe-wallet
Icon=CellframeWallet
Type=Application
Terminal=false
Categories=Network;Utility;
StartupWMClass=net.cellframe.cellframe-wallet
Name[ru_RU]=Cellframe wallet
EOF
}

package() {
	install -d "$pkgdir/usr/share/applications"
	install -Dm755 "$srcdir/$pkgname/build/Cellframe-Wallet" "$pkgdir/usr/bin/cellframe-wallet"
	install -Dm644 "$srcdir/$pkgname/os/debian/share/CellframeWallet.png" "$pkgdir/usr/share/pixmaps/CellframeWallet.png"
	install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$pkgname-tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

	_gen_desktop_file
}
