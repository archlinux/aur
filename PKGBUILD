# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: jopejoe1 <johannes@joens.email>

pkgname=python-bumpfontversion
_pyname=${pkgname#python-}
pkgver=0.4.1
pkgrel=3
pkgdesc='Bumps the version of a font source file'
arch=(any)
url="https://github.com/simoncozens/$_pyname"
license=(Apache-2.0)
_pydeps=(fonttools
         glyphslib
         openstep-plist
         ufolib2)
depends=(python
         bump2version
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-poetry-core
             python-poetry-plugin-export)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('be7c51e100d5d8a046b552dc0b7ed4c01424899adcd9e9bd1b018184ea9a7005')

prepare() {
	cd "$_archive"
	sed -i \
		-e '/^requires /s/poetry/poetry-core/g' \
		-e '/^build-backend /s/poetry/poetry.core/g' \
		pyproject.toml
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
