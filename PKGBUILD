# Maintainer: Tony Lambiris <tony@libpcap.net>

pkgname=gnome-shell-extension-cpupower-git
pkgver=10.1.2.r5.ge9e89c0
pkgrel=1
pkgdesc="Gnome-Shell Extension for intel-pstate driver"
arch=('any')
url="https://github.com/martin31821/cpupower.git"
license=('GPL3')
depends=('gnome-shell' 'polkit')
makedepends=('git' 'zip' 'unzip')
install=cpupower.install
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//g'
}

prepare() {
	cd "${srcdir}/${pkgname}"

	sed -i -e "s|VERSION=.*|VERSION=$pkgver|" Makefile
}


build() {
	cd "${srcdir}/${pkgname}"

	make build
}

package() {
	cd "${srcdir}/${pkgname}"

	EXTPATH="${pkgdir}/usr/share/gnome-shell/extensions/cpupower@mko-sl.de"
	install -dm755 "${EXTPATH}"
	cp -av * "${EXTPATH}"

	# install cpufreqctl tool to /usr/bin/cpufreqctl
	install -Dm555 "tool/cpufreqctl" "${pkgdir}/usr/bin/cpufreqctl"

	# polkit policy file, authorizes /usr/bin/cpufreqctl to run
	POLICYDIR="${pkgdir}/usr/share/polkit-1/actions"
	POLICYFILE="mko.cpupower.setcpufreq.policy"
	install -dm755 "${POLICYDIR}"
	install -Dm644 "data/mko.cpupower.policy.in" "${POLICYDIR}/${POLICYFILE}"

	# polkit rules file, handles policy requests
	RULESDIR="${pkgdir}/usr/share/polkit-1/rules.d"
	RULESFILE="10-mko.cpupower.setcpufreq.rules"
	install -dm750 "${RULESDIR}"
	install -Dm644 "data/${RULESFILE}" "${RULESDIR}/${RULESFILE}"

	# gsettings xml schema file
	SCHEMADIR="${pkgdir}/usr/share/glib-2.0/schemas"
	SCHEMAFILE="org.gnome.shell.extensions.cpupower.gschema.xml"
	install -dm755 "${SCHEMADIR}"
	install -Dm644 "schemas/${SCHEMAFILE}" "${SCHEMADIR}/${SCHEMAFILE}"

	# update policy to reflect cpufreqctl path
	sed -i -e 's:{{PATH}}:/usr/bin/cpufreqctl:g' \
		-e 's:{{ID}}:mko.cpupower.setcpufreq:g' "${POLICYDIR}/${POLICYFILE}"
}
