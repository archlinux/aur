# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_name=paddleocr
pkgname=${_name}-git
pkgdesc="Awesome multilingual OCR and document parsing toolkits based on PaddlePaddle"
pkgver=r6925.2661c7c
pkgrel=1
arch=(any)
url="https://github.com/PaddlePaddle/${_name}"
license=(Apache-2.0)
depends=(python-imagesize python-opencv python-pyclipper python-pypdfium2 python-bidi
  python-shapely python-yaml python-requests python-aiohttp python-typing_extensions
  paddlepaddle) # python-paddlex
makedepends=(python-build python-installer python-setuptools-scm python-wheel git)
provides=(${_name})
conflicts=(${_name})
source=(${_name}::git+${url}.git)
sha512sums=('SKIP')

prepare() {
  cd ${_name}
  sed -i '/opencv-contrib-python/d;s|==|>=|' requirements.txt
}

pkgver() {
  cd ${_name}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd ${_name}
  export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
