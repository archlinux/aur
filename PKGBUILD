# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.2.206
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
options=(!buildflags !makeflags)
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=7646cfb9b3c898ef444f46e30a6319bc82172100
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=c7b6e75b903529d767159b7fecb7a7b32a7d272c
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=49d4a39337a4cb89d05c887de65565c354702b7a
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=7c0171bca494153b8aa6b0270523dc428a616eb3
		raiden.cfg
		riemann.cfg
		subzero.cfg
		cellframe-node.cfg
		cellframe-node.service
		cellframe-node.logrotate
		LICENSE)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '1b3d9dbaa7bee6559426c670306e4c2a'
         '2bfdff51919fe20d56e3f1d6badd23b9'
         '14bab19dd6632b295110fab884f89d92'
         '08f08ee541825c83a6bbe3da82bd3556'
         '59d7ba76eb2280fd7ffc6ee0e418f547'
         '4ccc93f9055e3382025564a729430d34'
         'e6a600fd5e1d9cbde2d983680233ad02')

install=$pkgname.install
backup=('opt/cellframe-node/etc/cellframe-node.cfg')

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

	mkdir -p $_prefix/var/{run,lib/wallet,lib/global_db,lib/plugins,log} || return 1
	
	DESTDIR="$pkgdir" cmake --install build

	install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname" || return 1

	install -Dm 644 "$srcdir/$pkgname.logrotate" "$pkgdir/etc/logrotate.d/$pkgname" || return 1
	
	install -Dm 644 "$srcdir/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system" || return 1

	install -Dm 666 "$srcdir/$pkgname.cfg" -t "$_prefix/etc" || return 1

	mkdir -p "$pkgdir/usr/local/bin"

	for _executables in cellframe-node-cli cellframe-node-tool cellframe-node
	do
		ln -sf "/opt/$pkgname/bin/$_executables" "$pkgdir/usr/local/bin/$_executables"
	done

	for _nets in raiden.cfg riemann.cfg subzero.cfg
	do
		install -Dm 666 "$srcdir/$_nets" -t "$_prefix/etc/network" || return 1
	done
}
