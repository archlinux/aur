# Maintainer: Kishore G <kishore96 at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-ducc
pkgver=0.36.0
pkgrel=1

_name=ducc0
_pkgver_gitlab=$(echo $pkgver | sed s/\\./_/g)
_foldername="ducc-ducc0_$_pkgver_gitlab"

pkgdesc="Distinctly Useful Code Collection"
arch=('x86_64')
url='https://gitlab.mpcdf.mpg.de/mtr/ducc'
license=('GPL2' 'BSD')
depends=('python>=3.8' 'python-numpy')
makedepends=(
	'pybind11'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel')
# checkdepends=('python-pytest')
source=("https://gitlab.mpcdf.mpg.de/mtr/ducc/-/archive/ducc0_$_pkgver_gitlab/ducc-ducc0_$_pkgver_gitlab.tar.gz")
sha256sums=('a1b9cc02acb6ca1cfe5371a98c66eecd9ba0809578a5d7be666d388060b5c80b')

build() {
	cd "$_foldername"
	python -m build --wheel --no-isolation
}

## FIXME: tests fail because of nonexistent module ducc0.misc
# check() {
# 	cd "$_name-$pkgver"
# 	PYTHONPATH="$PWD/src" pytest -x --disable-warnings
# }

package() {
	cd "$_foldername"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl

	local _site="$(python -c 'import site; print(site.getsitepackages()[0])')"
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	ln -s \
		"$_site/$_name-$pkgver.dist-info/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/"
}
