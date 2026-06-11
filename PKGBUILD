# Maintainer: taotieren <admin@taotieren.com>

pkgname=renesas-flash-programmer-bin
pkgver=3.23.00
pkgrel=1
epoch=
pkgdesc="Renesas Flash Programmer"
arch=(x86_64)
url="https://www.renesas.com/rfp"
license=('LicenseRef-scancode-commercial-license')
depends=(
	glibc
	libgcc
	libstdc++
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
sha256sums=('4e2af9fe45de0bcdd20e102d8a984ad63ca3df3ad9d0ae8b7b77fff522307fca')
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
