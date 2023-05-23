# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=3.3.6
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
sha512sums=('25c663f4cfbcd60b169f9d1c3a5d2f773396d7be7a47d2ab23e051205ee267bca2a8249aaf08c790df6b302be60fb94833ca403e19c43e8d0634663591e177b8')

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
