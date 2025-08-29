# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sshpilot
pkgver=3.1.0
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
depends=('python')
makedepends=()
arch=('any')
sha256sums=('7805cc734f9ad8a02d4e1b33922f68652c08b6d0cab5d6d4647222032d68b4fc')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="${pkgname}-${pkgver}"

package() {
	depends+=('python-gobject' 'python-cairo' 'python-paramiko' 'python-cryptography' 'python-secretstorage' 'python-matplotlib')

	cd "${_srcdir}"

	local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

	# Install the main executable (runner)
	install -D -m 755 'run.py' "${pkgdir}/usr/bin/sshpilot"
	# Install resources into site-packages so app can import
	install -d "${pkgdir}${site_packages}/sshpilot"
	cp -a 'sshpilot'/*.py "${pkgdir}${site_packages}/sshpilot/"
	install -d "${pkgdir}${site_packages}/sshpilot/resources" "${pkgdir}${site_packages}/sshpilot/ui"
	cp -a 'sshpilot/resources'/* "${pkgdir}${site_packages}/sshpilot/resources/"
	cp -a 'sshpilot/ui'/* "${pkgdir}${site_packages}/sshpilot/ui/"
	# Install desktop file and icon
	install -D -m 644 'io.github.mfat.sshpilot.desktop' -t "${pkgdir}/usr/share/applications"
	install -D -m 644 'sshpilot/resources/sshpilot.svg' "${pkgdir}/usr/share/pixmaps/io.github.mfat.sshpilot.svg"
	install -D -m 644 'io.github.mfat.sshpilot.metainfo.xml' -t "${pkgdir}/usr/share/metainfo"
}
