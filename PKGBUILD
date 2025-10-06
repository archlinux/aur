# Maintainer: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Kevin Brubeck Unhammer <unhammer@gmail.com>

_name=jusText
pkgbase=justext
pkgname=python-justext
pkgver=3.0.2
pkgrel=1
pkgdesc="Heuristic based boilerplate removal tool"
url="https://github.com/miso-belica/justext"
arch=('any')
license=('BSD')
depends=('python-lxml-html-clean')
makedepends=('python-build' 'python-docutils' 'python-installer' 'python-pygments' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-cov')
provides=('justext')
replaces=('justext')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/miso-belica/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f3cded8bc02f06af3a77b8fd93b356807d43cce6299f0a7322c98fa99c788431')

build() {
	cd "${_name}-${pkgver}"

	python -m build --wheel --no-isolation
	rst2man README.rst "${srcdir}/justext.7"
}

check() {
	cd "${_name}-${pkgver}"
	python -m pytest
}

package() {
	cd "${_name}-${pkgver}"

	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm644 "${srcdir}/justext.7" -t "$pkgdir/usr/share/man/man7/"

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
	ln -s "${_site}/${_name}-${pkgver}.dist-info/LICENSE.rst" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
