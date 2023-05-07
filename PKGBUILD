# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_name=paddleocr
pkgname=${_name}-git
pkgdesc="Awesome multilingual OCR toolkits based on PaddlePaddle"
pkgver=r5997.013870d9
pkgrel=1
arch=('any')
url="https://github.com/PaddlePaddle/${_name}"
license=('Apache2')
depends=(python-shapely python-scikit-image python-imgaug python-pyclipper
  python-lmdb python-tqdm visualdl python-opencv python-lxml python-premailer
  python-openpyxl python-attrdict python-pymupdf paddlepaddle)
makedepends=(python-build python-installer python-setuptools python-wheel git)
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_name}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_name}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
