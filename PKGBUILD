# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=3.3.7
pkgrel=1
arch=(any)
url="https://github.com/ajslater/${pkgname}"
license=(GPL3)
depends=(python-confuse python-humanize python-dateutil python-rarfile python-treestamps python-pillow python-zipfile-deflate64 optipng)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-cov)
optdepends=('gifsicle: for animated GIFs support'
  'pngout: for optimize PNG images'
  'mozjpeg: for optimize JPEG images')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('b3772599e8938a42db204270f09f7125e0927906734c667c2a75c951c9fb9a4d23bed33f15285f3c786e255c963dad5c68f378cd710da90f9e35996155b60d20')

prepare() {
  sed -i 's/\["poetry.core.masonry.api"\]/"poetry.core.masonry.api"/' ${pkgname}-${pkgver}/pyproject.toml
}

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not containers and not images_dir and not one_container and not timestamps and not cli'
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
