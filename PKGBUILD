# Maintainer: AsamK <asmak ät gmx de>

pkgname=textsecure-cli
pkgver=0.2.1
pkgrel=2
pkgdesc="Provides a commandline and dbus interface for secure Signal/TextSecure messaging."
arch=('any')
url="https://github.com/AsamK/textsecure-cli"
license=('GPL3')
depends=('java-runtime' 'libmatthew-unix-java')
makedepends=('java-environment' 'gradle')
source=("https://github.com/AsamK/${pkgname}/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.sysusers.conf"
        "${pkgname}.tmpfiles.conf")
install="${pkgname}.install"
sha256sums=('19e4c66c5699e4a7cc2213c0df56ed3240ada49507c6b670133b33f2e6ccf760'
            '7c85aec83be668d64d336d0dd60f867647e256cafb5e599af94180a2c7c07391'
            'e4560cafef512e59935d1562f05dd55b04f6b2ead6bf2a888dc6f9ec5b342758'
            'b88c0978cffc09aaf70afa59dc5763e9f333728d8d6e530ea6ba8c6f3a4b2454')

build() {
	cd "${srcdir}"
	cd "${pkgname}-${pkgver}"

	gradle installDist
}

package() {
	install -m755 -d "${pkgdir}/usr/share/java/${pkgname}" \
	                  "${pkgdir}/usr/bin" \
	                  "${pkgdir}/usr/lib/systemd/system/" \
	                  "${pkgdir}/usr/lib/sysusers.d/" \
	                  "${pkgdir}/usr/lib/tmpfiles.d/" \
	                  "${pkgdir}/etc/dbus-1/system.d/"

	cd "${srcdir}"

	install -m644 "${pkgname}.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
	install -m644 "${pkgname}.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
	install -m755 "${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"

	cd "${pkgname}-${pkgver}"

	install -m644 "data/org.asamk.TextSecure.conf" "${pkgdir}/etc/dbus-1/system.d/"
	install -m644 "data/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/"
	sed -i "s|%dir%|/usr|" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"

	cd "build/install/${pkgname}"

	install -m644 lib/*.jar "${pkgdir}/usr/share/java/${pkgname}/"
}
