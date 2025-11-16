# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
# Based on aur/sshpilot
# Upstream Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=sshpilot
pkgname="$_pkgname-git"
pkgver=r2241.gb0d9e5a
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'python-cairo' 'python-paramiko' 'python-cryptography' 'python-matplotlib' 'libadwaita' 'vte4' 'sshpass' 'libsecret')
makedepends=('git')
arch=('any')
sha256sums=('SKIP')
source=("git+${url}.git")
provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_pkgname}"

	local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

	# Install the main executable (runner)
	install -D -m 755 'run.py' "${pkgdir}/usr/bin/sshpilot"
	# Install resources into site-packages so app can import
	install -d "${pkgdir}${site_packages}/sshpilot"
	cp -a 'sshpilot'/*.py "${pkgdir}${site_packages}/sshpilot/"
	install -d "${pkgdir}${site_packages}/sshpilot/resources" "${pkgdir}${site_packages}/sshpilot/ui"
	cp -a 'sshpilot/resources'/* "${pkgdir}${site_packages}/sshpilot/resources/"
	# Install desktop file and icon
	install -D -m 644 'io.github.mfat.sshpilot.desktop' -t "${pkgdir}/usr/share/applications"
	install -D -m 644 'sshpilot/resources/sshpilot.svg' "${pkgdir}/usr/share/pixmaps/io.github.mfat.sshpilot.svg"
	install -D -m 644 'io.github.mfat.sshpilot.metainfo.xml' -t "${pkgdir}/usr/share/metainfo"
}
