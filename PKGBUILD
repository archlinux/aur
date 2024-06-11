# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node-debug
_pkgname=cellframe-node
pkgver=5.2.528
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
source=(git+https://gitlab.demlabs.net/cellframe/$_pkgname.git#commit=c9c5bd2c27c252d6bc241df7ba339e51856d1a76
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=7346d9f69239d716bb066f56db6dc28010dca0b9
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=499c8858524a974f30facbdbd0e3cf2c21c818c7
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=374312f888b663e96f0b17373e880dabeb1a670d
		cellframe-node.logrotate
		cellframe-node-logrotate.service
		cellframe-node-logrotate.timer
		cellframe-node.service
		cellframe-node.asan.service)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '6a52220e0b285dc9e803082f36897ad4'
         '7c1087eea7336d99c4af55119673b009'
         '47edb0d55d537e72f3de07ec6a72ea78'
         '72472d529b38f06a78f37ac659b18d65'
         '42a6fdb6b79a93d0a31dd33a40456c9c')
install=$_pkgname.install
conflicts=(cellframe-dashboard cellframe-wallet cellframe-node)
options=(!strip !debug)

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
		-DCMAKE_C_FLAGS="-fpermissive" \
        -Wno-dev
	cmake --build build -j$(nproc)
}

package() {
	cd "$_pkgname"
	
	DESTDIR="$pkgdir" cmake --install build

	install -Dm 644 "$srcdir/$_pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"

	install -Dm 644 "$srcdir/$_pkgname.logrotate" "$pkgdir/etc/logrotate.d/$_pkgname"

	if [ $DAP_ASAN ]; then
		install -Dm 644 "$srcdir/$_pkgname.asan.service" "$pkgdir/usr/lib/systemd/system/$_pkgname.service"
	else
		install -Dm 644 "$srcdir/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"
	fi	

	install -Dm 644 "$srcdir/$_pkgname-logrotate.service" -t "$pkgdir/usr/lib/systemd/system"
	
	install -Dm 644 "$srcdir/$_pkgname-logrotate.timer" -t "$pkgdir/usr/lib/systemd/system"
}
