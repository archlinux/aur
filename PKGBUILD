# Maintainer: Viech <viech unvanquished net>

# This is based on the 'foundryvtt' package by Grant Moyer and Tomas S.
# Their package uses the shipped binaries and installs a .desktop file.
# This package uses a systemwide node.js and installs a systemd service.

# NOTE: You need to manually download FoundryVTT-Node-<version>.zip.

_name=foundryvtt
pkgname=foundryvtt-server
pkgver=14.365
pkgrel=1
pkgdesc="A self-hosted and modern roleplaying platform. node.js/systemd version."
arch=('any')
url="https://foundryvtt.com/"
license=('custom')
depends=(nodejs)
makedepends=(systemd)
options=(!strip)
source=("FoundryVTT-Node-${pkgver}.zip::local://FoundryVTT-Node-${pkgver}.zip"
        "foundryvtt.service"
        "foundryvtt.sysusers"
        "foundryvtt.tmpfiles")
sha256sums=('6f9bc29bb3e20abf78aaa2182192e7233a008c2f7c45ade70e6082da20bebc8f'
            'fe5ccf362d2dda46f9dd181a0ce277b1800dcd401f4c4743b7c3b1bdfa3b76b3'
            '4397966e1d0160e83991953be98b0f765142a197d16e3437a8750a979b398691'
            'eda9e8fa3b459b4d61ff50c3d0fe15ff37dbd00c75522dc3d24ff1d2a4220ad8')

package() {
	install -m755 -d "${pkgdir}/usr/lib/${_name}"
	install -m755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m755 -d "${pkgdir}/usr/lib/sysusers.d"
	install -m755 -d "${pkgdir}/usr/lib/tmpfiles.d"
	install -m755 -d "${pkgdir}/usr/share/licenses/${_name}"

	install -m644 main.js              "${pkgdir}/usr/lib/${_name}/"
	install -m644 main.mjs             "${pkgdir}/usr/lib/${_name}/"
	install -m644 package-lock.json    "${pkgdir}/usr/lib/${_name}/"
	install -m644 package.json         "${pkgdir}/usr/lib/${_name}/"
	install -m644 tsconfig.json        "${pkgdir}/usr/lib/${_name}/"
	install -m644 "${_name}.service"   "${pkgdir}/usr/lib/systemd/system/"
	install -m644 "${_name}.sysusers"  "${pkgdir}/usr/lib/sysusers.d/${_name}.conf"
	install -m644 "${_name}.tmpfiles"  "${pkgdir}/usr/lib/tmpfiles.d/${_name}.conf"
	install -m644 license.html         "${pkgdir}/usr/share/licenses/${_name}/"

	cp -r {client,common,dist,node_modules,public,templates} "${pkgdir}/usr/lib/${_name}/"
}

post_install() {
	systemd-sysusers
	systemd-tmpfiles
}
