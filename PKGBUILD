# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.1.366
pkgrel=3
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
depends=(python logrotate)
makedepends=(git cmake python)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
options=(!buildflags !makeflags)
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=2918cb9fd3d1df774df78bb706db052741696186
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=b32dfcdc37fb192ef2253c8eec86fa8e3d3c8c44
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=3c4b8a87a47ea0cba1231245ac0663d2bce06b6d
		cellframe-node.cfg
		Backbone.cfg
		kelvpn-minkowski.cfg
		mileena.cfg
		subzero.cfg
		cellframe-node.service
		cellframe-node.logrotate
		cellframe-node.sh
		LICENSE)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '47f1aa606f2b91d4dfbc22ea263d540a'
         '65a864051d256b08d656079d1c6fa7af'
         '0b5a872c2ea133a4df0443a415e9f311'
         'f5bc95f5f8915d074c66398b2acb0907'
         'be8dc9bddf5354074993df8377da03a4'
         'f6fa69bc2e3896fda661c84d2a2c3192'
         '4ccc93f9055e3382025564a729430d34'
         '797a5e1704727d387713105e1f101d99'
         'e6a600fd5e1d9cbde2d983680233ad02')
install=$pkgname.install
backup=('opt/cellframe-node/etc/cellframe-node.cfg')

prepare() {
	cd "$srcdir"
	rm -rf "$srcdir/$pkgname/cellframe-sdk"
	rm -rf "$srcdir/$pkgname/python-cellframe"
	ln -sf "$srcdir/cellframe-sdk" "$srcdir/$pkgname/cellframe-sdk"
	ln -sf "$srcdir/python-cellframe" "$srcdir/$pkgname/python-cellframe"
}

build() {
	cd "$pkgname"
	cmake -B build \
		-DCMAKE_BUILD_TYPE='Release' \
		-DCREATE_DEFAULT_CONFIG=OFF \
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

	install -Dm 644 "$srcdir/$pkgname.sh" -t "$pkgdir/etc/profile.d" || return 1

	install -Dm 644 "$srcdir/$pkgname.cfg" -t "$_prefix/etc" || return 1

	for _nets in Backbone.cfg kelvpn-minkowski.cfg mileena.cfg subzero.cfg
	do
		install -Dm 644 "$srcdir/$_nets" -t "$_prefix/etc/network" || return 1
	done
}
