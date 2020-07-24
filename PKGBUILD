#
# Maintainer: Patrick Oppenlander <patrick.oppenlander at gmail.com>
#
pkgname=pegdbserver_power
pkgver=2.0.2.202005132054
pkgrel=1
pkgdesc="GDB server for Power devices using P&E JTAG hardware"
url="http://www.pemicro.com"
arch=(x86_64)
license=(custom)
depends=(libusb-compat)
makedepends=(wget unzip gzip)
install=pegdbserver_power.install
source=(license_gdb.pdf 55-pemicro.rules)
sha256sums=(6b135ddd5388f6a0dd1d1d9d6c6d7321423f391914312c4a4aafd9d851d10dbc
            4b9812f801faedb8a39c7e95bd829efeeb2941b1f4fb3ca774cfbf1ef4fa4081)
options=('!strip')

prepare() {
	wget -q -O- http://www.pemicro.com/eclipse/updates/com.pemicro.debug.gdbjtag.ppc.updatesite/artifacts.jar | \
		zcat | grep "<artifact.*com.pemicro.debug.gdbjtag.ppc.feature" | cut -d\' -f6 > version
	wget -O source.jar http://www.pemicro.com/eclipse/updates/com.pemicro.debug.gdbjtag.ppc.updatesite/plugins/com.pemicro.debug.gdbjtag.ppc_$(cat version).jar
	unzip -q source.jar
}

pkgver() {
	cat version
}

package() {
	mkdir -p "$pkgdir/opt/$pkgname"
	cp -r lin/* "$pkgdir/opt/$pkgname"
	chmod +x "$pkgdir/opt/$pkgname/pegdbserver_power_console"
	chmod 644 "$pkgdir/opt/$pkgname/gdi/P&E"/*
	chmod 666 "$pkgdir/opt/$pkgname/gdi/P&E"/*.add

	mkdir -p "$pkgdir/etc/udev/rules.d"
	cp 55-pemicro.rules "$pkgdir/etc/udev/rules.d"

	mkdir -p "$pkgdir/usr/bin"
	ln -s /opt/$pkgname/pegdbserver_power_console "$pkgdir/usr/bin/pegdbserver_power_console"

	mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
	cp license_gdb.pdf "$pkgdir/usr/share/licenses/$pkgname"
}

