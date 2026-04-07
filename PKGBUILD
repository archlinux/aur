# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-dataconfy
_pyname=${pkgname#python-}
pkgver=0.0.3
pkgrel=1
pkgdesc='configuration and data persistence for Python applications'
arch=(any)
url="https://github.com/lucabello/$_pyname"
license=(Apache-2.0)
_pydeps=(platformdirs
         pyyaml)
depends=(python
        "${_pydeps[@]/#/python-}"
        vulture)
makedepends=(python-{build,installer,wheel}
             python-uv-build)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('162412eb2feece36541ea72be7a191d18c9b7b914f5af9515ae400c47072c947')

prepare () {
	cd "$_archive"
	# Upstream aggressively pins dependencies, including max versions of uv-build
	sed -i -E 's/"([^<>=]+)[<>=][<>=\.,0-9]+"/"\1"/g' pyproject.toml
}

build () {
	cd "$_archive"
	python -m build -wn
}

package () {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
