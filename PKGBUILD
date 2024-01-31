# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node-debug
_pkgname=cellframe-node
pkgver=5.2.444
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
source=(git+https://gitlab.demlabs.net/cellframe/$_pkgname.git#commit=e0be2db8b27fd2a0669c58d202641c8782e5ac5b
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=089cb91c3cf9962a35ff2460bc0d4846a0a254eb
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=a4f88f68509796c9d20c6639c41475c67464a586
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=cb8f3b3965fdfb42a164644ae27d00d9efb229b5
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
install=$_pkgname.install
conflicts=(cellframe-dashboard cellframe-wallet cellframe-node)
options=(!strip)

prepare() {
	rm -rf "$srcdir/$_pkgname/cellframe-sdk"
	rm -rf "$srcdir/$_pkgname/python-cellframe"
	rm -rf "$srcdir/$_pkgname/dap-sdk"
	ln -sf "$srcdir/cellframe-sdk" "$srcdir/$_pkgname/cellframe-sdk"
	ln -sf "$srcdir/python-cellframe" "$srcdir/$_pkgname/python-cellframe"
	ln -sf "$srcdir/dap-sdk" "$srcdir/$_pkgname/dap-sdk"
}

build() {
	cd "$_pkgname"
	cmake -B build \
		-DCMAKE_BUILD_TYPE='Debug' \
        -Wno-dev
	cmake --build build -j$(nproc)
}

package() {
	cd "$_pkgname"
	
	DESTDIR="$pkgdir" cmake --install build

	install -Dm 644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"

	install -Dm 644 "$srcdir/$_pkgname.logrotate" "$pkgdir/etc/logrotate.d/$_pkgname"

	install -Dm 644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

	install -Dm 644 "$srcdir/$_pkgname-logrotate.service" -t "$pkgdir/usr/lib/systemd/system"
	
	install -Dm 644 "$srcdir/$_pkgname-logrotate.timer" -t "$pkgdir/usr/lib/systemd/system"
}
