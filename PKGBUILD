# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=3.3.5
pkgrel=1
arch=(any)
url="https://github.com/ajslater/${pkgname}"
license=(GPL3)
depends=(python-confuse python-humanize python-dateutil python-rarfile python-treestamps python-pillow optipng)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-cov)
optdepends=('gifsicle: for animated GIFs support'
  'pngout: for optimize PNG images'
  'mozjpeg: for optimize JPEG images')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('10a5493aee715873cecd45cf3d17ec340fb119bf4673dae897f42c4183ba9ec4babcefbcc4e76afc007a1349d824a9da40df24f203c262c9c21b00dbe4c7eff4')

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
