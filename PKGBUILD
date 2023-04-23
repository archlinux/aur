# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-node
pkgver=5.1.387
pkgrel=1
pkgdesc="Cellframe blockchain node with a powerful SDK"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('LGPL3')
depends=(python logrotate)
makedepends=(git cmake python)
provides=("cellframe-node" "cellframe-node-cli" "cellframe-node-tool")
options=(!buildflags !makeflags)
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=e96323052ff157641f932c1c8d97d321a6eeb8ba
		git+https://gitlab.demlabs.net/cellframe/cellframe-sdk.git#commit=2db952b9ee4ca56d31f9b68f1277fc19c22b62b6
		git+https://gitlab.demlabs.net/cellframe/python-cellframe.git#commit=a31ba6e2bdd9163033a8031b060b4dcdf9bad413
		cellframe-node.cfg
		Backbone.cfg
		kelvpn-minkowski.cfg
		mileena.cfg
		subzero.cfg
		cellframe-node.service
		cellframe-node.logrotate
		LICENSE)
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         '47f1aa606f2b91d4dfbc22ea263d540a'
         '65a864051d256b08d656079d1c6fa7af'
         '3509a0da9090e05a8b46087a13d93dcd'
         'f5bc95f5f8915d074c66398b2acb0907'
         'be8dc9bddf5354074993df8377da03a4'
         'f6fa69bc2e3896fda661c84d2a2c3192'
         '4ccc93f9055e3382025564a729430d34'
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

	install -Dm 666 "$srcdir/$pkgname.cfg" -t "$_prefix/etc" || return 1

	mkdir -p "$pkgdir/usr/local/bin"

	for _executables in cellframe-node-cli cellframe-node-tool cellframe-node
	do
		ln -sf "/opt/$pkgname/bin/$_executables" "$pkgdir/usr/local/bin/$_executables"
	done

	for _nets in Backbone.cfg kelvpn-minkowski.cfg mileena.cfg subzero.cfg
	do
		install -Dm 666 "$srcdir/$_nets" -t "$_prefix/etc/network" || return 1
	done
}
