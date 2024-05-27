# Maintainer: dreieck

_pymodule="mtcnn"
_pkgname="python-${_pymodule}"
pkgname="${_pkgname}"
pkgdesc="Implementation of the MTCNN face detector for Keras. Written from scratch, using as a reference the implementation of MTCNN from David Sandberg (FaceNet’s MTCNN) in Facenet. Based on the paper Zhang, K et al. (2016)"
# url="https://pypi.org/project/mtcnn/"
url="http://github.com/ipazc/mtcnn"
license=("MIT")
epoch=0
pkgver=0.1.1
pkgrel=1
arch=(
  'any'
)
depends=(
  'python>=3.4'
  'python-keras'
  'python-opencv'
  'python-tensorflow>=2.2'
)
makedepends=(
  'python-setuptools'
)
provides=(
  "python3-${_pymodule}=${pkgver}"
)
conflicts=(
  "python3-${_pymodule}"
)
optdepends=()
source=(
  # "python-${_pymodule}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/b4/8e/6565beb364587befbef5efad314e14f78be85d65c3709a4da09bd9dfbb65/${_pymodule}-${pkgver}.tar.gz"
  "python-${_pymodule}-${pkgver}.tar.gz::https://pypi.debian.net/${_pymodule}/${_pymodule}-${pkgver}.tar.gz"
  "python-${_pymodule}-${pkgver}-LICENSE::https://raw.githubusercontent.com/ipazc/mtcnn/master/LICENSE"
)
sha256sums=(
  'd0957274584be62cb83d4a089041f8ee3cf3b1893e45f01ed3356f94a381302b'
  'fd9642bdf0c3ae1231a961b5b471f01559608d7530bcd7c669eb7dcf17c57940'
)
validpgpkeys=()


build() {
  cd "${srcdir}/${_pymodule}-${pkgver}"
  printf '%s\n' "${url}" > "upstream.url"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pymodule}-${pkgver}"

  ## See https://wiki.archlinux.org/title/Python_package_guidelines#Reproducible_bytecode
  export PYTHONHASHSEED=0

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  for _docfile in AUTHORS PKG-INFO README.rst requirements.txt upstream.url; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  for _srcdirlicense in "python-${_pymodule}-${pkgver}-LICENSE"; do
    install -D -m644 -v "${srcdir}/${_srcdirlicense}" "${pkgdir}/usr/share/licenses/${pkgname}/${_srcdirlicense}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_srcdirlicense}" "${pkgdir}/usr/share/doc/${_pkgname}/${_srcdirlicense}"
  done
}
