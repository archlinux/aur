# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname="cellframe-dashboard"
_nodename="cellframe-node"
pkgver=2.13.34
pkgrel=1
pkgdesc="Super application for managing Cellframe node"
arch=(x86_64 aarch64)
url="https://cellframe.net"
license=(GPL3)
depends=(qt5-graphicaleffects qt5-base qt5-quickcontrols2 qt5-quickcontrols logrotate libxcrypt-compat)
makedepends=(git qt5-base qt5-declarative cmake python3)
options=(!debug)
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=fa0f405873d28e0b6ea70baed68f9ddb8c3b3b85
		cellframe-node.logrotate
		cellframe-node-logrotate.timer
		cellframe-node-logrotate.service
		cellframe-node.service)
md5sums=('SKIP'
         '6a52220e0b285dc9e803082f36897ad4'
         '47edb0d55d537e72f3de07ec6a72ea78'
         '7c1087eea7336d99c4af55119673b009'
         '72472d529b38f06a78f37ac659b18d65')
conflicts=(cellframe-node cellframe-wallet)
install=$pkgname.install

prepare() {
	cd "$srcdir/$pkgname"
	cat << EOF > .gitmodules
[submodule "cellframe-ui-sdk"]
	path = cellframe-ui-sdk
	url = https://gitlab.demlabs.net/cellframe/cellframe-ui-sdk.git
	branch = master
[submodule "dap-ui-sdk"]
	path = dap-ui-sdk
	url = https://gitlab.demlabs.net/dap/dap-ui-sdk
	branch = master
[submodule "prod_build"]
	path = prod_build
	url = https://gitlab.demlabs.net/cellframe/prod_build_cellframe-dashboard
	branch = master
[submodule "cellframe-node"]
	path = cellframe-node
	url = https://gitlab.demlabs.net/cellframe/cellframe-node
	branch = master
[submodule "web3_api"]
	path = web3_api
	url = https://gitlab.demlabs.net/cellframe/web3_api.git
    branch = master

EOF
	echo "+++ Fetching submodule sources..."
	git submodule sync
	git submodule update --init --recursive
}

build() {
	cd "$srcdir/$pkgname"
	qmake
	make -j$(nproc)
}

package() {
	cd "$srcdir/$pkgname"
	make INSTALL_ROOT="$pkgdir" install
	install -Dm 644 "$pkgdir/opt/$pkgname/share/CellFrameDashboard.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm 644 "$pkgdir/opt/$pkgname/share/init.d/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 "$srcdir/$pkgname/$_nodename/LICENSE" -t "$pkgdir/usr/share/licenses/$_nodename"
	install -Dm 644 "$srcdir/$_nodename.logrotate" "$pkgdir/etc/logrotate.d/$_nodename"
	install -Dm 644 "$srcdir/$_nodename-logrotate.service" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "$srcdir/$_nodename-logrotate.timer" -t "$pkgdir/usr/lib/systemd/system"
	install -Dm 644 "$srcdir/$_nodename.service" -t "$pkgdir/usr/lib/systemd/system"
}
