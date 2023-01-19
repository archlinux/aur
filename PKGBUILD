# Maintainer: Ildus Kurbangaliev <i.kurbangaliev@gmail.com>

pkgname=yosys-uhdm-plugin
pkgver=924fe98
pkgrel=1
pkgdesc='UDHM plugin for Yosys (SystemVerilog support)'
arch=('x86_64')
url='https://github.com/antmicro/yosys-uhdm-plugin-integration/releases'
license=('ISC License')
provides=('yosys-uhdm-plugin')
depends=('oss-cad-suite-build-bin')
makedepends=('jq' 'curl' 'wget')

source=("https://api.github.com/repos/antmicro/yosys-uhdm-plugin-integration/releases/latest")
sha512sums=('SKIP')

prepare() {
	cat latest | jq '.assets[1]["browser_download_url"]' | xargs wget -O - | tar -xz
}

pkgver() {
	cat latest | jq '.tag_name' | grep -Eo '[^-"]*' | head -1
}

package() {
	YOSYS_DATDIR=$(yosys-config --datdir)
	YOSYS_PLUGIN_DIR=$pkgdir/$YOSYS_DATDIR/plugins
	UHDM_PLUGIN_PATH=$srcdir/image/share/yosys/plugins/systemverilog.so

	mkdir -p $YOSYS_PLUGIN_DIR
	cp -v $UHDM_PLUGIN_PATH $pkdir/$YOSYS_PLUGIN_DIR/systemverilog.so
}
