# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
_pkgname=rtmlib
pkgname=python-rtmlib-git
pkgver=0.1.r79.gece30dd
pkgrel=1
pkgdesc="A lightweight library for RTMPose-based pose estimation."

arch=('any')
url="https://github.com/Tau-J/rtmlib"
license=('Apache-2.0') 

depends=(
  'python'
  'python-numpy'
  'python-onnxruntime'
  'python-opencv'
  'python-tqdm'
)

makedepends=(
  'git'
  'patch'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)

provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git"
        'setup.py.patch')
sha256sums=('SKIP'
            '24cdb9b557b3ed5eab0185bb6132534fe39ce4a8920e296486fd0b1ce6244912')

pkgver() {
  cd "${_pkgname}"
  printf "0.1.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  patch -p1 < ../setup.py.patch
}

build() {
  cd "${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  pip install --root="${pkgdir}" --no-deps --no-build-isolation dist/*.whl
}
