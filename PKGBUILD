# Maintainer: dreieck

_pymodule="mtcnn"
_pkgname="python-${_pymodule}"
pkgname="${_pkgname}-git"
pkgdesc="Implementation of the MTCNN face detector for Keras. Written from scratch, using as a reference the implementation of MTCNN from David Sandberg (FaceNet’s MTCNN) in Facenet. Based on the paper Zhang, K et al. (2016)"
# url="https://pypi.org/project/mtcnn/"
url="http://github.com/ipazc/mtcnn"
license=("MIT")
epoch=0
pkgver=1.0.0+r62.20241008.14c9b05
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
  'git'
  'python-setuptools'
)
provides=(
  "${_pkgname}=${pkgver}"
  "python3-${_pymodule}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "python3-${_pymodule}"
)
optdepends=()
source=(
  "${_pymodule}::git+https://github.com/ipazc/mtcnn.git"
)
sha256sums=(
  'SKIP'
)
validpgpkeys=()


pkgver() {
  cd "${srcdir}/${_pymodule}"
  _ver="$(grep -E '^[[:space:]]*__version__[[:space:]]*=' mtcnn/metadata.py | awk -F= '{print $2}' | tr -d "[[:space:]]\"'")"
  _rev="$(git rev-list HEAD --count)"
  _date="$(git log -1 --format=%cd --date=format:%Y%m%d)"
  _hash="$(git rev-parse --short HEAD)"
  if [ -z ${_ver} ]; then
    error "Could not determine version."
    exit 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}/${_pymodule}"
  printf '%s\n' "${url}" > "upstream.url"

  python setup.py build
}

package() {
  cd "${srcdir}/${_pymodule}"

  ## See https://wiki.archlinux.org/title/Python_package_guidelines#Reproducible_bytecode
  export PYTHONHASHSEED=0

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  for _docfile in AUTHORS README.rst requirements.txt example.py example.ipynb upstream.url; do
    install -D -m644 -v "${_docfile}" "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

  for _license in "LICENSE"; do
    install -D -m644 -v "${_license}" "${pkgdir}/usr/share/licenses/${pkgname}/${_license}"
    ln -svr "${pkgdir}/usr/share/licenses/${pkgname}/${_license}" "${pkgdir}/usr/share/doc/${_pkgname}/${_license}"
  done
}
