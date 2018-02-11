# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=infineon-firmware-updater
pkgver=1.1.2459.0
pkgrel=1
pkgdesc='Update firmware on Infineon TPMs'
arch=('x86_64')
url='https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+/master/chromeos-base/infineon-firmware-updater'
license=('BSD-Infineon', 'custom')
depends=('openssl-1.0')
# FIXME use fixed revision
source=(
	"infineon-firmware-updater-ebuild-${pkgver}.tar.gz::https://chromium.googlesource.com/chromiumos/overlays/chromiumos-overlay/+archive/master/chromeos-base/infineon-firmware-updater.tar.gz"
	"https://gsdview.appspot.com/chromeos-localmirror/distfiles/infineon-firmware-updater-${pkgver}.tar.gz"
)

prepare() {
	patch -p1 < "${srcdir}/files/"/makefile-fixes.patch
	patch -p1 < "${srcdir}/files/"/unlimited-log-file-size.patch
	patch -p1 < "${srcdir}/files/"/dry-run-option.patch
	patch -p1 < "${srcdir}/files/"/change_default_password.patch
	patch -p1 < "${srcdir}/files/"/retry-send-on-ebusy.patch
	patch -p1 < "${srcdir}/files/"/ignore-error-on-complete-option.patch
}

build() {
	LDFLAGS="-L/usr/lib/openssl-1.0/"
	CPPFLAGS="-Wimplicit-fallthrough=0 -I/usr/include/openssl-1.0"
	make -C TPMFactoryUpd
}

package() {
	install -D -m755 "${srcdir}/TPMFactoryUpd/TPMFactoryUpd" "${pkgdir}/usr/bin/TPMFactoryUpd"
	ln -s TPMFactoryUpd "${pkgdir}/usr/bin/infineon-firmware-updater"
	install -D -m644 \
		"${srcdir}/Common/MicroTss/Tpm_2_0/LICENSE.txt" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.infineon-firmware-updater-TCG"
}

sha256sums=('SKIP'
            '774fc6c07b71612f12a53cb4ffddbf05d7f6a67fe0c295e62895694c2ecd2a30')
