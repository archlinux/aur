# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.2.192
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
makedepends=(git cmake python3)
depends=(logrotate libxcrypt-compat)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
options=(!buildflags !makeflags)
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=0b7b043bcb50fec85f7d0955a76a620b45f571ab
		git+https://gitlab.demlabs.net/dap/dap-sdk.git#commit=ad7b842d9ef33155311e8f2e5691df082b72d0b7
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=d57fecc76f3aecb5b7a61f53bdfbc1855124ea77
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=a270592fb69b3b21843fd964b2ef7812d312dd53
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
         'f6fa69bc2e3896fda661c84d2a2c3192'
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
