# Maintainer: Viech <viech unvanquished net>

# This is based on the 'foundryvtt' package by Grant Moyer and Tomas S.
# Their package uses the shipped binaries and installs a .desktop file.
# This package uses a systemwide node.js and installs a systemd service.

# NOTE: You need to manually download FoundryVTT-<version>.zip.

_name=foundryvtt
pkgname=foundryvtt-server
pkgver=12.343
pkgrel=1
pkgdesc="A self-hosted and modern roleplaying platform. node.js/systemd version."
arch=('any')
url="https://foundryvtt.com/"
license=('custom')
depends=(nodejs)
makedepends=(systemd)
options=(!strip)
source=("FoundryVTT-${pkgver}.zip::local://FoundryVTT-${pkgver}.zip"
        "foundryvtt.service"
        "foundryvtt.sysusers"
        "foundryvtt.tmpfiles")
sha256sums=('0b6d957f01cabc090bb6c658ec13392810bc92da2fa2937f1cb4d26202752387'
            'b25541a2e83e46d8fc82a4af3eb44ef7b83705764c22480f4d426e8916e9cfa3'
            '4397966e1d0160e83991953be98b0f765142a197d16e3437a8750a979b398691'
            'eda9e8fa3b459b4d61ff50c3d0fe15ff37dbd00c75522dc3d24ff1d2a4220ad8')

package() {
	install -m755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m755 -d "${pkgdir}/usr/lib/sysusers.d"
	install -m755 -d "${pkgdir}/usr/lib/tmpfiles.d"
	install -m755 -d "${pkgdir}/usr/lib/${_name}"
	install -m755 -d "${pkgdir}/usr/share/doc/${_name}/examples"
	install -m755 -d "${pkgdir}/usr/share/licenses/${_name}"

	install -m644 "${_name}.service"   "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "${_name}.sysusers"  "${pkgdir}/usr/lib/sysusers.d/${_name}.conf"
	install -m644 "${_name}.tmpfiles"  "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"

	cp -r "${srcdir}/"{locales,resources} "${pkgdir}/usr/lib/${_name}/"
	ln -rs "${pkgdir}/usr/lib/${_name}/resources/app/license.html" "${pkgdir}/usr/share/licenses/${_name}/"
}

post_install() {
	systemd-sysusers
	systemd-tmpfiles
}
