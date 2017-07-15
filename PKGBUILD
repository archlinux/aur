# Maintainer: Jingrong Chen <crazyboycjr at gmail dot com>
pkgname=dingtalk-electron
_pkgname=${pkgname//-/_}
pkgver=1.1.0
pkgrel=1
pkgdesc="钉钉Linux版本"
arch=('x86_64')
url="https://github.com/nashaofu/dingtalk#readme"
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-sharp' 'libxtst' 'nss' 'libxss')
source=("https://github.com/nashaofu/dingtalk/releases/download/v1.1.0/dingtalk_1.1.0_amd64.deb")

pkgver() {
	cd "${srcdir}"

	tar xzvf control.tar.gz -C "${srcdir}" 2>&1 >/dev/null

	echo "$(sed -ne 's/^Version: \([^-]\+\).*/\1/p' ${srcdir}/control)"
}

package() {
	tar xJvf data.tar.xz -C "${pkgdir}"
	mkdir -p "${pkgdir}"/opt/dingtalk
	mv "${pkgdir}/opt/钉钉"/* "${pkgdir}/opt/dingtalk"
	rmdir "${pkgdir}/opt/钉钉"

	sed -ine 's/^Exec=.*/Exec=\/opt\/dingtalk\/dingtalk/' "${pkgdir}"/usr/share/applications/dingtalk.desktop

	find "${pkgdir}" -type d | xargs chmod 755

	mkdir -p "${pkgdir}"/usr/local/bin/
	ln -sf /opt/dingtalk "${pkgdir}"/usr/local/bin/dingtalk

	find "${pkgdir}" -type f | xargs chown root:root
}

md5sums=('7c6e6b757d97d43138a79febdee2c584')
