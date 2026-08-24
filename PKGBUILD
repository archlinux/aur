# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-spacy
_pkg="${pkgname#python-}"
pkgver=3.8.16
pkgrel=1
pkgdesc='Free open-source library for Natural Language Processing in Python'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/spacy'
license=('MIT')
depends=(
    'python-catalogue'
    'python-confection'
    'python-click'
    'python-cymem'
    'python-jinja'
    'python-langcodes'
    'python-murmurhash'
    'python-numpy'
    'python-preshed'
    'python-pydantic'
    'python-requests'
    'python-spacy-loggers'
    'python-srsly'
    'python-thinc'
    'python-tqdm'
    'python-typer'
    'python-wasabi'
    'python-weasel')
makedepends=(
    'cython'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/release-v${pkgver}.tar.gz")
sha256sums=('e74a8c389fb2b03725ff2d60fea19f39f8019e36a97d5e2a15e9a261bb01ad71')

prepare() {
    _dirname=$(bsdtar -tf "${source[0]%%::*}" | awk -F / '{print $1; exit}')
    ln -s "$_dirname" $_pkg-$pkgver
}

build() {
	cd "${_pkg}-${pkgver}"
	## skip dependency check because of pinned deps
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "${_pkg}-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
