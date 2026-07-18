# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=sshpilot
pkgver=5.5.5
pkgrel=1
pkgdesc='SSH connection manager with integrated terminal, tunneling, tabbed interface and scp upload support.'
url='https://github.com/mfat/sshpilot'
license=('GPL-3.0-only')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
arch=('any')
sha256sums=('2104dc32f1a53c55babc10f36ee63aaca14aa52deb79a26a8e8a7e1e7687ce8f')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")

_srcdir="${pkgname}-${pkgver}"

build() {
	cd "${_srcdir}"
	python -m build --wheel --no-isolation
}

package() {
	depends+=(
		'python-gobject' 'python-cairo' 'python-paramiko' 'python-cryptography' 'python-matplotlib'
		'libadwaita' 'vte4' 'sshpass' 'libsecret' 'gtksourceview5' 'webkitgtk-6.0' 'python-flask' 'python-flask-socketio')

	cd "${_srcdir}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	local site_packages="$(python -c "import site; print(site.getsitepackages()[0])")"

	# Install the main executable (runner)
	install -D -m 755 'run.py' "${pkgdir}/usr/bin/sshpilot"
	# Install desktop file and icon
	install -D -m 644 'io.github.mfat.sshpilot.desktop' -t "${pkgdir}/usr/share/applications"
	install -D -m 644 'sshpilot/resources/sshpilot.svg' "${pkgdir}/usr/share/pixmaps/io.github.mfat.sshpilot.svg"
	install -D -m 644 'io.github.mfat.sshpilot.metainfo.xml' -t "${pkgdir}/usr/share/metainfo"
	# Install resources
	install -d -m 755 "${pkgdir}${site_packages}/sshpilot/resources"
	cp -a 'sshpilot/resources'/* "${pkgdir}${site_packages}/sshpilot/resources"
	# Install vendored pyxtermjs module
	cp -a 'sshpilot/vendor' "${pkgdir}${site_packages}/sshpilot"
}
