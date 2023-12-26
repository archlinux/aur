# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname="cellframe-dashboard"
_nodename="cellframe-node"
pkgver=2.12.81
pkgrel=1
pkgdesc="Super application for managing Cellframe node"
arch=(x86_64 aarch64)
url="https://cellframe.net"
license=(GPL3)
depends=(qt5-graphicaleffects qt5-base qt5-quickcontrols2 qt5-quickcontrols logrotate libxcrypt-compat)
makedepends=(git qt5-base qt5-declarative cmake python3)
options=(!makeflags !buildflags)
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=4a55d77efdb3c6a05fbb8b802706ae979b31859d)
md5sums=(SKIP)
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
	git submodule sync &> /dev/null
	git submodule update --init --recursive &> /dev/null
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
	install -Dm 644 "$srcdir/$pkgname/$_nodename/dist.linux/share/logrotate/$_nodename" "$pkgdir/etc/logrotate.d/$_nodename"
	install -Dm 644 "$srcdir/$pkgname/$_nodename/dist.linux/share/$_nodename.service" -t "$pkgdir/usr/lib/systemd/system"
}
