# Maintainer: Edmund Lodewijks <edmund@proteamail.com>

_name=roman-numerals
pkgname=python-roman-numerals
pkgver=4.1.0
pkgrel=1
pkgdesc='Manipulate well-formed Roman numerals'
arch=(any)
url=https://github.com/AA-Turner/roman-numerals/tree/master/python
license=('0BSD OR CC0-1.0')
depends=(python)
makedepends=(
  git
  python-build
  python-flit-core
  python-installer
)
checkdepends=(python-pytest)
source=("git+https://github.com/AA-Turner/roman-numerals.git#tag=v$pkgver")
b2sums=('b1c0788cefc46d9fcde21b62b076f89ecc72559793b6202ac6f8809ac076051d574ca5fc7eaa28d4d275f3b39bee7de06c362c145a2a3bfb1cbfa5cece2b5511')
provides=(python-roman-numerals-py)
conflicts=(python-roman-numerals-py)

prepare() {
  cd $_name
  ln -ft python LICENCE.rst
}

build() {
  cd $_name/python
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd $_name/python
  pytest
}

package() {
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/roman_numerals-$pkgver.dist-info/licenses/LICENCE.rst \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENCE.rst

  cd $_name/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
