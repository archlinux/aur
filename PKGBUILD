# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Your Name <arch7nelliel@gmail.com>
# Developer: Taylor Marks <taylor@marksfam.com>

pkgname=python-playsound
_reponame=playsound
pkgver=1.3.0
pkgrel=2
pkgdesc="Pure Python library for playing sounds"
arch=('any')
url="https://github.com/TaylorSMarks/playsound"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
changelog=CHANGES
source=(
	"${pkgname}-${pkgver}.tar.gz::https://github.com/TaylorSMarks/playsound/archive/v${pkgver}.tar.gz"
	'setup.py.patch')
sha256sums=('a830c77ad613e0580642d677453a9bc6924a06d5d9447a5ab676ff3621f5d9ee'
            '9dad08ea67730400466065d3b7db345b94bb581a55431baba9ad8350976f93c8')

prepare() {
	patch -p1 -d "${_reponame}-${pkgver}" < setup.py.patch
}

build() {
	cd "${_reponame}-${pkgver}"
	python -m build --wheel --no-isolation
}

package() {
	cd "${_reponame}-${pkgver}"
	PYTHONHASHSEED=0 python -m installer --destdir="${pkgdir}/" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -s \
		"${_site}/${_reponame}-${pkgver}.dist-info/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"
}
