# Maintainer: J. Nathanael Philipp (jnphilipp) <nathanael@philipp.land>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: Chris Brendel <cdbrendel@gmail.com>

pkgname=python-spacy
_pkg="${pkgname#python-}"
pkgver=3.8.8
pkgrel=1
pkgdesc='Free open-source library for Natural Language Processing in Python'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/spacy'
license=('MIT')
depends=(
	'python-catalogue'
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
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/s/$_pkg/$_pkg-$pkgver.tar.gz")
sha256sums=('08b933bd1f0f47f59321fe730a06c645120084719e718960a2e596a3728aea84')

prepare() {
    cd "$_pkg-$pkgver"
    sed -i '/PACKAGES =/c\PACKAGES = find_packages(exclude=["spacy.tests*"])' setup.py
    rm -rf "$_pkg.egg-info"
}

build() {
	cd "$_pkg-${pkgver}"
	## skip dependency check because of pinned deps
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$_pkg-${pkgver}"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
