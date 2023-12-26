# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.2.399
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=f2c6d54f4429b2c2b2e7c2f671b6099865e7cfa2
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=21afc6e44d4bbb6bec69d8d561c58819a9fb903a
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=131e3e959470875e7344d1400e1269b727efc76e
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=7f5675fe814807659475833ba77253b20a31e3c3)
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
