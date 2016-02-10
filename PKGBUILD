# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=acpi_call-dkms
pkgver=1.1.0
pkgrel=4
pkgdesc='A linux kernel module that enables calls to ACPI methods through /proc/acpi/call'
arch=('any')
url='http://github.com/mkottman/acpi_call'
license=('GPL')
depends=('dkms')
makedepends=('markdown')
optdepends=('linux-headers: needed if using archlinux default kernel'
	    'linux-lts-headers: needed if using the archlinux lts kernel')
provides=('acpi_call')
conflicts=('acpi_call')
install=acpi_call.install
source=("acpi_call-v${pkgver}.tar.gz::http://github.com/mkottman/acpi_call/archive/v${pkgver}.tar.gz")
sha256sums=('d0d14b42944282724fca76f57d598eed794ef97448f387d1c489d85ad813f2f0')

prepare() {
	cd "${srcdir}/acpi_call-${pkgver}"

	# Fix build with Linux >= 3.17
	sed -i 's|acpi/acpi.h|linux/acpi.h|' acpi_call.c

	# create dkms.conf
	cat > dkms.conf <<EOF
# Linux DKMS config script for acpi_call

PACKAGE_VERSION=${pkgver}
PACKAGE_NAME=acpi_call
AUTOINSTALL=yes

BUILT_MODULE_NAME[0]="acpi_call"
DEST_MODULE_LOCATION[0]="/extra"
EOF
}

build() {
	cd "${srcdir}/acpi_call-${pkgver}"

	markdown README.md > README.html
}

package() {
	cd "${srcdir}/acpi_call-${pkgver}"

	install -D -m0644 Makefile "${pkgdir}/usr/src/acpi_call-${pkgver}/Makefile"
	install -D -m0644 dkms.conf "${pkgdir}/usr/src/acpi_call-${pkgver}/dkms.conf"
	install -D -m0644 acpi_call.c "${pkgdir}/usr/src/acpi_call-${pkgver}/acpi_call.c"

	# install examples
	install -d "${pkgdir}/usr/share/acpi_call"
	install -m0755 examples/*.sh "${pkgdir}/usr/share/acpi_call/"

	# install support
	install -D -m0755 support/query_dsdt.pl "${pkgdir}/usr/share/acpi_call/query_dsdt.pl"
	install -D -m0644 support/windump_hack/windump.c "${pkgdir}/usr/share/acpi_call/windump_hack/windump.c"
	install -D -m0644 support/windump_hack/xorg.conf "${pkgdir}/usr/share/acpi_call/windump_hack/xorg.conf"

	# install REAMDE
	install -D -m0644 README.md "${pkgdir}/usr/share/doc/acpi_call/README.md"
	install -D -m0644 README.html "${pkgdir}/usr/share/doc/acpi_call/README.html"
}

