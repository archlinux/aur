# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=gnome-shell-extension-cpupower-git
_gitname=cpupower
pkgver=106.8c3c255
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
            'df3874afa2b8fd01874d9be4f8b6e1c197ad7aafdce0ae7849419813c3699a2d')

pkgver() {
	cd $_gitname
	echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
	cd $_gitname
	patch -Np1 -i "${srcdir}/arch.patch"
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
