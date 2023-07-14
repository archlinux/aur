# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.2.231
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
options=(!buildflags !makeflags)
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=3a1543a4dc6d66a9efcc26920d81547bd1e1fa30
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=6827b5500171c968c956f0d4c0610af5adc587e2
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=69c7a2d5e3eb1514323622e89d0e0cdc677ebaaa
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=4c798d2de99e92fca560c8387e4c8cd3d1c67604)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

install=$pkgname.install

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

	_prefix="$pkgdir/opt/$pkgname"

	mkdir -p $_prefix/var/{run,lib/wallet,lib/global_db,lib/plugins,log}
	
	DESTDIR="$pkgdir" cmake --install build

	install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"

	install -Dm 644 "$srcdir/$pkgname/dist.linux/share/logrotate/$pkgname" "$pkgdir/etc/logrotate.d/$pkgname"

	install -Dm 644 "$srcdir/$pkgname/dist.linux/share/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

	mkdir -p "$pkgdir/usr/local/bin"

	for _executables in cellframe-node-cli cellframe-node-tool cellframe-node
	do
		ln -sf "/opt/$pkgname/bin/$_executables" "$pkgdir/usr/local/bin/$_executables"
	done
}
