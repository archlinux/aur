# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=NiaAML
pkgname=python-${_base,,}
pkgver=1.1.6
pkgrel=1
pkgdesc="Python automated machine learning framework"
url="https://github.com/lukapecnik/${_base}"
arch=('any')
license=(MIT)
depends=(python-niapy python-scikit-learn)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('e2508c1c0bc199a0a1aef1e2d475f5ceb92cea209ad23b0827901b576bf09efe79feed07b482075e54f8bdbc632516214aec6761a5e010e78eabd5b69322bd49')

prepare() {
  # https://src.fedoraproject.org/rpms/python-niaaml/blob/f35/f/0001-Fix-version-check-in-setup.py-for-Python-3.10.patch
  cd "${_base}-${pkgver}"
  sed -i 's/^MINIMUM_PYTHON_VERSION = "3.6.2"/MINIMUM_PYTHON_VERSION = (3, 6, 2)/' setup.py
  sed -i 's/^    if sys.version < MINIMUM_PYTHON_VERSION:/    if sys.version_info < MINIMUM_PYTHON_VERSION:/' setup.py
  # https://github.com/NiaOrg/NiaPy/issues/371
  sed -i '/^    description/,+2d' setup.py
}

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_base}-${pkgver}"
  python -m pytest -k 'not pipeline'
}

package() {
  cd "${_base}-${pkgver}"
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
