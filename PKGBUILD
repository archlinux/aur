# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_name=paddleocr
pkgname=${_name}-git
pkgdesc="Awesome multilingual OCR toolkits based on PaddlePaddle"
pkgver=2.8.0.r112.g661cda12
pkgrel=1
arch=(any)
url="https://github.com/PaddlePaddle/${_name}"
license=(Apache-2.0)
depends=(python-shapely python-scikit-image python-imgaug python-pyclipper
  python-lmdb python-tqdm visualdl python-opencv python-rapidfuzz cython
  python-pillow python-yaml python-docx python-beautifulsoup4 python-fonttools
  python-fire python-requests python-albucore python-albumentations paddlepaddle)
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
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
