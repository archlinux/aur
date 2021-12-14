# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Sam L. Yes <samlukeyes123@gmail.com>
_name=paddleocr
pkgname=${_name}-git
pkgver=r3045.63cd23ab
pkgrel=1
pkgdesc="Awesome multilingual OCR toolkits based on PaddlePaddle"
url="https://github.com/PaddlePaddle/${_name}"
depends=(python-shapely python-scikit-image python-imgaug python-pyclipper python-lmdb python-tqdm visualdl python-levenshtein python-opencv python-lxml python-premailer python-openpyxl paddlepaddle)
makedepends=(python-setuptools git)
provides=(${_name})
conflicts=(${_name})
license=('Apache2')
arch=('any')
source=(${_name}::git+${url}.git)
sha512sums=('SKIP')

prepare() {
  cd "${_name}"
  sed -i '/opencv-contrib-python/d;s|==|>=|' requirements.txt
}

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_name}"
  python setup.py build
}

package() {
  cd "${_name}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${_name}/LICENSE
}
