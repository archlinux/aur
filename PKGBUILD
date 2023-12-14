# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.2.389
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=2f0e7e763b4690bf90dce27976cf5f53b86086a7
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=ecbbc849ec811e2c0a305abdf90d4636cc00ddf7
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=67087f486cf051a5103053b9634ef85cd8b529e5
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=443c99e69c1ad79a6db359f64cadd6abccb782b7)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')
install=$pkgname.install
conflicts=(cellframe-dashboard cellframe-wallet)

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

	install -Dm 644 "$srcdir/$pkgname/dist.linux/share/logrotate/$pkgname" "$pkgdir/etc/logrotate.d/$pkgname"

	install -Dm 644 "$srcdir/$pkgname/dist.linux/share/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
}
