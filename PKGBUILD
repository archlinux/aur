# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-youseedee
_pyname=${pkgname#python-}
pkgver=0.6.0
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
sha256sums=('f70eb2af6f33ab42e03af329e5f08568718ec0ae306db0e8fe0d631f8524cb41')

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
