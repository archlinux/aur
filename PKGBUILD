# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-youseedee
_pyname=${pkgname#python-}
pkgver=0.7.0
pkgrel=1
pkgdesc='Interface to the Unicode Character Database'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(MIT)
_pydeps=(requests)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
# source=("$url/archive/v$pkgver/$_archive.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('6f9831048aff9a8c33946e3f3740b6d92d574ead0d0064ead7ffa23147f10f5f')

prepare() {
	cd "$_archive"
	# Unpin aggressive build system dependencies
	sed -i -Ee '/^requires/s/>=[0-9\.]+//g' pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	# install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
