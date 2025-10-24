# Maintainer: taotieren <admin@taotieren.com>

pkgname=renesas-flash-programmer-bin
pkgver=3.21.00
pkgrel=2
epoch=
pkgdesc="Renesas Flash Programmer"
arch=(x86_64)
url="https://www.renesas.com/rfp"
license=('LicenseRef-scancode-commercial-license')
depends=(
	gcc-libs
	glibc
	libusb
	zlib
)
makedepends=(
	libarchive
)
optdepends=(
	"e2-studio: Eclipse-based IDE for Renesas MCUs"
	"fsp-bin: Flexible Software Package (FSP) for Renesas RA MCU Family"
)
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
options=(!strip !debug !lto)
_installer="RFP_CLI_Linux_V${pkgver//./}_x64.tgz"
source=(
	"file:///$_installer"
)
sha256sums=('f69ca20487274437f540bc4aae728e366ebc728abe9bdad0791f042fecfdf3c0')
noextract=(
	$_installer
)
package() {
	install -dm0755 ${pkgdir}/usr/bin \
		${pkgdir}/opt/renesas/rfp

	bsdtar -xf "${srcdir}/$_installer" --strip-components=1 -C ${pkgdir}/opt/renesas/rfp

	cd ${pkgdir}/opt/renesas/rfp

	install -Dm644 docs/License* -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 docs/Third* -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 docs/*.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 docs/Readme* -t "${pkgdir}/usr/share/doc/${pkgname}"
	install -Dm644 *.rules -t "${pkgdir}/usr/lib/udev/rules.d/"

	chmod 755 r*

	ln -sf /opt/renesas/rfp/rfp-cli ${pkgdir}/usr/bin/rfp-cli
	ln -sf /opt/renesas/rfp/rpe ${pkgdir}/usr/bin/rpe
	ln -sf /opt/renesas/rfp/libRFP.so ${pkgdir}/usr/lib/libRFP.so

	rm -rf docs *.rules
	chown root:root -R ${pkgdir}
}
