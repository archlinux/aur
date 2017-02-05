# Maintainer: Patrick Oppenlander <patrick.oppenlander at gmail.com>
#
# Note: to build this package you need to download S32_Power_Linux_v1.1.bin from
# http://www.nxp.com/products/microcontrollers-and-processors/arm-processors/s32-arm-processors-microcontrollers/s32-design-studio-ide:S32DS?code=S32DS&nodeId=0150522FC830D4&fpsp=1&tab=Design_Tools_Tab
# and place it in the same location as this PKGBUILD file.
#
pkgname=pegdbserver_power
pkgver=1.3.3.201605241936
pkgrel=2
pkgdesc="GDB server for Power devices using P&E JTAG hardware"
arch=('i386' 'x86_64')
url="http://www.nxp.com/products/microcontrollers-and-processors/arm-processors/s32-arm-processors-microcontrollers/s32-design-studio-ide:S32DS?code=S32DS&nodeId=0150522FC830D4&fpsp=1&tab=Design_Tools_Tab"
license=('custom')
depends=('libusb-compat')
makedepends=('unzip')
install=pegdbserver_power.install
source=('file://S32_Power_Linux_v1.1.bin' 'license_gdb.pdf')
sha256sums=('f378b5e397d7664c36c02c86b69f7237ad525eac2109ac4ddb50404cb1132a97'
            '6b135ddd5388f6a0dd1d1d9d6c6d7321423f391914312c4a4aafd9d851d10dbc')
noextract=('S32_Power_Linux_v1.1.bin')

build() {
	unzip S32_Power_Linux_v1.1.bin || true
	unzip C_/MakingInstalers/Layout/eclipse_zg_ia_sf.jar plugins/com.pemicro.debug.gdbjtag.ppc_$pkgver/lin/*
	unzip C_/MakingInstalers/Layout/Drivers_zg_ia_sf.jar libusb_64_32/*
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -r plugins/com.pemicro.debug.gdbjtag.ppc_$pkgver/lin/* "$pkgdir/opt/$pkgname"
	chmod +x "$pkgdir/opt/$pkgname/pegdbserver_power_console"
	chmod 644 "$pkgdir/opt/$pkgname/gdi/P&E"/*
	chmod 666 "$pkgdir/opt/$pkgname/gdi/P&E"/*.add

	mkdir -p "$pkgdir/etc/udev/rules.d"
	cp libusb_64_32/55-pemicro.rules "$pkgdir/etc/udev/rules.d"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/$pkgname/pegdbserver_power_console "$pkgdir/usr/bin/pegdbserver_power_console"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp license_gdb.pdf "$pkgdir/usr/share/licenses/$pkgname"
}

