# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.2.457
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=4f4d30090a10c1b554f09f1e3ec75713cf7354f1
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=b68cf8f6fe8d9d65c1b4e6e13c09b5fef0429359
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=2c859604bfefbdf0abfce1a3f325bb705326d50c
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=30ec106625c937bd56cf79b1e6e6baf649a0c31e
		cellframe-node.logrotate
		cellframe-node-logrotate.service
		cellframe-node-logrotate.timer
		cellframe-node.service)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '6a52220e0b285dc9e803082f36897ad4'
         '7c1087eea7336d99c4af55119673b009'
         '47edb0d55d537e72f3de07ec6a72ea78'
         '72472d529b38f06a78f37ac659b18d65')
install=$pkgname.install
conflicts=(cellframe-dashboard cellframe-wallet cellframe-node-debug)

prepare() {
	rm -rf "$srcdir/$pkgname/cellframe-sdk"
	rm -rf "$srcdir/$pkgname/python-cellframe"
	rm -rf "$srcdir/$pkgname/dap-sdk"
	ln -sf "$srcdir/cellframe-sdk" "$srcdir/$pkgname/cellframe-sdk"
	ln -sf "$srcdir/python-cellframe" "$srcdir/$pkgname/python-cellframe"
	ln -sf "$srcdir/dap-sdk" "$srcdir/$pkgname/dap-sdk"
}

build() {
	cd "$pkgname"
	cmake -B build \
		-DCMAKE_BUILD_TYPE='Release' \
        -Wno-dev
	cmake --build build -j$(nproc)
}

package() {
	cd "$pkgname"
	
	DESTDIR="$pkgdir" cmake --install build

	install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm 644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname"

	install -Dm 644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

	install -Dm 644 "$srcdir/$pkgname-logrotate.service" -t "$pkgdir/usr/lib/systemd/system"
	
	install -Dm 644 "$srcdir/$pkgname-logrotate.timer" -t "$pkgdir/usr/lib/systemd/system"
}
