# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
pkgname=picopt
pkgdesc="A multi format lossless image optimizer that uses external tools"
pkgver=4.0.0
pkgrel=1
arch=(any)
url="https://github.com/ajslater/${pkgname}"
license=(GPL-3.0-only)
depends=(python-confuse python-humanize python-piexif python-pyoxipng
  python-dateutil python-rarfile python-treestamps python-pillow)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest-cov)
optdepends=('gifsicle: for animated GIFs support'
  'pngout: for optimize PNG images'
  'mozjpeg: for optimize JPEG images')
source=(https://pypi.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha512sums=('13cbf306e098321e273fcfac6b5b450ab056ad64333d131414eb66af14b83cd88afb3f0873186d502e87ca40d9099409c3c148d34785388a9b566525346fc5f5')

build() {
  cd ${pkgname}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${pkgname}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not containers and not images_dir and not one_container and not timestamps and not convert_to_jpeg and not preserve'
}

package() {
  cd ${pkgname}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
