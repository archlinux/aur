# Maintainer: Sematre <sematre at gmx dot de>
pkgname=asem51-bin
pkgver=1.3
pkgrel=2
pkgdesc="A two-pass macro assembler for the Intel MCS-51 family of microcontrollers."
arch=('i386' 'x86_64')
url="http://plit.de/asem-51/"
license=('custom')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}.tar.gz::http://plit.de/asem-51/${pkgname%-bin}-${pkgver}-ELF.tar.gz"
        "mcufiles-20080923.zip::http://plit.de/asem-51/mcufiles.zip")
md5sums=('895fd5e6617f8b21b9f56484f9258c94'
         '23eb370c4d674e190a05f33da5704519')

prepare() {
	cd "${srcdir}"
	ln -s ../setup-environment-variable.sh setup-environment-variable.sh

	# Remove DOS line endings
	sed -i 's/.$//' MCU/*

	# Patch in the updated mcu files + docs
	rm asem51/mcu/*
	mv MCU/* asem51/mcu/

	mv HTML/DERIVAT.HTM asem51/html/derivat.htm
}

package() {
	cd "${srcdir}/asem51"

	# Install the executables
	find . -type f \( -not -name '*.sh' \)  -executable -exec install -Dm755 "{}" -t "${pkgdir}/usr/bin" \;

	# Install the device specifications
	find mcu/ -type f  -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/${pkgname%-bin}/mcu" \;
	install -Dm644 "../setup-environment-variable.sh" "${pkgdir}/etc/profile.d/asem51.sh"

	# Install the man pages
	find . -name '*.1' -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/man/man1" \;

	# Install the docs
	find html/ -type f -exec install -Dm644 "{}" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}/html" \;

	install -Dm644 "asem_51.doc"    "${pkgdir}/usr/share/doc/${pkgname%-bin}/asem.doc"
	install -Dm644 "boot51.doc"  -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"

	install -Dm644 "README.1ST"     "${pkgdir}/usr/share/doc/${pkgname%-bin}/README"
	install -Dm644 "support.doc" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
	install -Dm644 "license.doc"    "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
}
