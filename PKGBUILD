# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-cpupower-git
_gitname=cpupower
pkgver=92.750ac85
pkgrel=1
pkgdesc="Gnome-Shell Extension for intel-pstate driver"
arch=('any')
url="https://github.com/martin31821/cpupower"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
install='cpupower.install'
source=('git+https://github.com/martin31821/cpupower.git' 'arch.patch')
sha256sums=('SKIP'
            '0b10479c61da00a8229cedfd557b619b6d865016af99dd3ee44eaf638be70a84')

pkgver() {
	cd $_gitname
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	cd $_gitname
	patch -p1 -i "${srcdir}/arch.patch"
}

package() {
	cd $_gitname
	_extid="cpupower@mko-sl.de"
	_extpath="${pkgdir}/usr/share/gnome-shell/extensions/${_extid}"

	DIR="/usr/share/gnome-shell/extensions/cpupower@mko-sl.de/src"
	CFC="${DIR}/cpufreqctl"
	POLICY="mko.cpupower.setcpufreq"
	RULEIN="${_extpath}/data/mko.cpupower.policy.in"
	RULEDIR="${pkgdir}/usr/share/polkit-1/actions"
	SCHEMADIR="${pkgdir}/usr/share/glib-2.0/schemas"

	install -dm755 "${_extpath}"
	cp -a * "${_extpath}"

	chown root:root "${pkgdir}/${CFC}"
	chmod 0555 "${pkgdir}/${CFC}"

	mkdir -p "${RULEDIR}" "${SCHEMADIR}"
	sed "s:xxxPATHxxx:${CFC}:g" "${RULEIN}" > "${RULEDIR}/${POLICY}.policy"

	cp schemas/org.gnome.shell.extensions.cpupower.gschema.xml "${SCHEMADIR}"
}
