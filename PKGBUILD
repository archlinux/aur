# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>
# Contributor: DanManN <dnahimov@gmail.com>

pkgname=python-thinc-git
_pkgname="${pkgname%-git}"
_pkg="${_pkgname#python-}"
pkgver=8.1.6.r2.g17fbcf43
pkgrel=1
pkgdesc='Practical Machine Learning for NLP'
arch=('x86_64' 'aarch64')
url='https://github.com/explosion/thinc'
license=('MIT')
depends=(
	'python-blis'
	'python-catalogue'
	'python-cymem'
	'python-mock'
	'python-murmurhash'
	'python-numpy'
	'python-packaging'
	'python-plac'
	'python-preshed'
	'python-pydantic'
	'python-six'
	'python-srsly'
	'python-tqdm'
	'python-wasabi')
makedepends=(
	'cython'
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkgname" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"
	sed -i '18c\PACKAGES = find_packages(exclude=["thinc.tests*"])' setup.py
	sed -i '5,6d' MANIFEST.in
}

build() {
	## dep checks fail with python-blis
	cd "$_pkgname"
	python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -dv "$pkgdir/usr/share/licenses/$pkgname/"
	ln -sv "$_site/$_pkg-${pkgver/.r*/}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"

}
