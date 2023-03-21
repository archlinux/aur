# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=busylight-for-humans
pkgname=busylight
pkgver=0.26.0
pkgrel=1
pkgdesc='Control USB connected presence lights from multiple vendors'
arch=('i686' 'x86_64')
url='https://github.com/JnyJny/busylight'
license=('Apache')
makedepends=('python-setuptools' 'python-poetry')
depends=(
  'python' 'python-bitvector-for-humans' 'python-click' 'python-hidapi'
  'python-loguru' 'python-typer' 'python-webcolors' 'uvicorn' 'python-fastapi' 'python-pyserial'
)
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('6ed9047bec370d7333dcc005d0930014e480eda59de400e2888c35a4e405764b')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  echo -e "\n[tool.poetry.build]\ngenerate-setup-file = true" >> pyproject.toml
  cd "${pkgname}"
  POETRY_CACHE_DIR=${srcdir}/poetry-cache poetry build -f sdist

  cd "${srcdir}/${pkgname}-${pkgver}"
  tar xf dist/${_pkgname//-/_}-${pkgver}.tar.gz

  cd "${_pkgname//-/_}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/${_pkgname//-/_}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
