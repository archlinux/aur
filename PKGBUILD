# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.2.466
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=f6eab632b0e548de9eafd75c4570cdcf8f931ae5
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=91c96fad691b2cf934f57f069cf74269f62b7743
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=0bf01fb083a016fd6252605785fc46a84155136d
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=65e7897cc5cc24da47693bb2b87c0f1d0ba4ad98
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
options=(!debug)

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
