# Maintainer: taotieren <admin@taotieren.com>

pkgbase=nuclei-dlink-gdbserver
pkgname=(nuclei-dlink-gdbserver{,-console})
_name=nuclei-dlink_gdbserver
pkgver=0.9.1
pkgrel=1
pkgdesc="Nuclei DLink GDB Server Tool"
arch=($CARCH)
license=('Apache-2.0')
# provides=(${pkgname})
# conflicts=(${pkgname})
depends=(
	gcc-libs
	glibc
	qt6-base
	qt6-serialport
)
makedepends=(
	libglvnd
	qt6-tools)
url="https://github.com/Nuclei-Software/nuclei-dlink_gdbserver"

source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('af87281a557dac5e0240fe7db33e924a96a0ef0dc9735478a886af151c152bbb')

build() {
	cd "$srcdir/${_name}-${pkgver}"
	MAJARVERSION=$(<./version.txt cut -d '.' -f 1)
	SUBVERSION=$(<./version.txt cut -d '.' -f 2)
	REVISION=$(<./version.txt cut -d '.' -f 3)
	APP_VERSION="v"$MAJARVERSION"."$SUBVERSION"."$REVISION
	sed -i 's|/opt/\$\${TARGET}|\$\${PREFIX}|g' dlink_gdbserver.pro
	sed -i 's|/opt/\$\${TARGET}|\$\${PREFIX}|g' dlink_gdbserver_console.pro
}

package_nuclei-dlink-gdbserver() {
	provides=(${pkgname})
	conflicts=(${pkgname})
	depends+=(libglvnd)
	cd "$srcdir/${_name}-${pkgver}"
	qmake6 ./dlink_gdbserver.pro -spec linux-g++ CONFIG+=qtquickcompiler CONFIG+=release
	make install INSTALL_ROOT=${pkgdir}/usr
	install -Dvm664 dlink_gdbserver.cfg -t ${pkgdir}/usr/share/${pkgname}/
	install -Dvm644 logo.ico ${pkgdir}/usr/share/pixmaps/${pkgname}.ico

	install -Dvm644 /dev/stdin ${pkgdir}/usr/share/applications/${pkgname}.desktop <<EOF
[Desktop Entry]
Type=Application
Name=${pkgname}
Comment=${pkgdesc}
Exec=dlink_gdbserver
Icon=${pkgname}.ico
Terminal=false
Categories=Utility

EOF
}

package_nuclei-dlink-gdbserver-console() {
	pkgdesc+=" Console"
	provides=(${pkgname})
	conflicts=(${pkgname})
	depends+=(nuclei-dlink-gdbserver)
	cd "$srcdir/${_name}-${pkgver}"
	qmake6 ./dlink_gdbserver_console.pro -spec linux-g++ CONFIG+=qtquickcompiler CONFIG+=release
	make install INSTALL_ROOT=${pkgdir}/usr
	install -Dm0644 /dev/stdin "${pkgdir}/usr/lib/udev/rules.d/50-dlink.rules" <<EOF
SUBSYSTEMS=="usb", ATTRS{idVendor}=="28e9", ATTRS{idProduct}=="018a", GROUP="uucp", MODE="0666"
EOF
}
