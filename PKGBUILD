# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-wallet
pkgver=1.1.6
pkgrel=3
pkgdesc="Cellframe wallet"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('GPL3')
depends=(cellframe-node qt5-graphicaleffects qt5-base qt5-quickcontrols2 qt5-quickcontrols qt5-svg)
makedepends=(git qt5-base qt5-declarative qt5-svg)
options=()
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=3477bbec4de917455e4fa1629eb7b2427835d5df)
md5sums=('SKIP')
install=$pkgname.install

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive --progress
}

build() {
	cd "$srcdir/$pkgname"
	sed -i 's|CellFrameNode||g' CellframeWalletProject.pro
	head -n -1 CellframeWalletProject.pro | tee CellframeWalletProject.pro 
	qmake
	make -j$(nproc)
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir" install
	mkdir -p "$pkgdir/opt/$pkgname/dapps/download"
	mkdir -p "$pkgdir/var/log/$pkgname"
	chmod -R 777 "$pkgdir/opt/$pkgname/dapps"
	chmod -R 777 "$pkgdir/var/log/$pkgname"
	install -Dm 644 "$pkgdir/opt/$pkgname/share/CellFrameWallet.desktop" -t "$pkgdir/usr/share/applications/" || return 1
	install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname" || return 1

}
