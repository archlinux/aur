# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-cpupower-git
_gitname=cpupower
pkgver=r122.8c26f16
pkgrel=1
pkgdesc="Gnome-Shell Extension for intel-pstate driver"
arch=('any')
url="https://github.com/martin31821/cpupower"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git')
install='cpupower.install'
source=('git+https://github.com/martin31821/cpupower.git')
sha256sums=('SKIP')

pkgver() {
	cd $_gitname

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
