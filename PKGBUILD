# Maintainer: Mika Hyttinen <mika dot hyttinen+arch ät gmail dot com>
pkgname=cellframe-dashboard
pkgver=2.10.25
pkgrel=1
pkgdesc="Super application for managing Cellframe node"
arch=('x86_64' 'aarch64')
url="https://cellframe.net"
license=('GPL3')
depends=(cellframe-node qt5-graphicaleffects qt5-base qt5-quickcontrols2 qt5-quickcontrols)
makedepends=(git qt5-base qt5-declarative)
options=()
source=(git+https://gitlab.demlabs.net/cellframe/$pkgname.git#commit=50ab34941438c86e043094e92b50516874016bb4)
md5sums=('SKIP')
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
EOF
	git submodule sync
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	sed -i 's|CellFrameNode||g' CellFrameDashboard.pro
	head -n -2 CellFrameDashboard.pro | tee CellFrameDashboard.pro
	qmake-qt5
	make -j$(nproc)
}

package() {
	cd "$srcdir/$pkgname"
	
	make INSTALL_ROOT="$pkgdir" install

	install -Dm 644 "$pkgdir/opt/$pkgname/share/CellFrameDashboard.desktop" -t "$pkgdir/usr/share/applications/" || return 1

	install -Dm 644 "$pkgdir/opt/$pkgname/share/init.d/$pkgname.service" -t "$pkgdir/usr/lib/systemd/system/" || return 1

	install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname" || return 1

}
