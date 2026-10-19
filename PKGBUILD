# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>

pkgname=registry-spy
pkgver=1.1.0
pkgrel=1
pkgdesc='Windows registry browser.'
url='https://ajsmith.org/projects/registry-spy/'
license=('GPL-3.0-only')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'git')
arch=('any')
sha256sums=('fc126bf6f2fb320cd1fce39ebe85f5ab292e8c09309e8a2863133f4e71af1037'
            'f6613e257c1e59b9ac630b2dd968ce1d7b84ea1b540611cb49d728e55a8a52bc')
source=(
	"git+https://github.com/andyjsmith/Registry-Spy.git#tag=v${pkgver}"
	"${pkgname}-desktop.patch::https://github.com/andyjsmith/Registry-Spy/pull/10.patch")

_srcdir='Registry-Spy'

prepare() {
	cd "${_srcdir}"
	patch -p1 -i "${srcdir}/${pkgname}-desktop.patch"
	sed -i 's/self.setItem(0, 3, QtWidgets.QTableWidgetItem(root_name_item))/self.setItem(0, 3, root_name_item)/' 'registryspy/hive_info_table.py'
}

build() {
	cd "${_srcdir}"
	python -m build --wheel --no-isolation
}

package() {
	depends+=('python-registry' 'pyside6')

	cd "${_srcdir}"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 'org.ajsmith.RegistrySpy.desktop' -t "${pkgdir}/usr/share/applications"
	install -Dm644 'registryspy/img/icon.png' "${pkgdir}/usr/share/pixmaps/org.ajsmith.RegistrySpy.png"
}
