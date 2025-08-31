# Maintainer: Caleb Jamison <cbjamo@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-skidl
_name=${pkgname#python-}
pkgver=2.1.0
pkgrel=1
pkgdesc="A Python package for textually describing electronic circuit schematics."
arch=(any)
# url="https://pypi.org/project/skidl"
url="https://github.com/devbisme/skidl"
license=('MIT')
groups=()
_py_deps=(
  graphviz
  pygame
  # AUR
  kinet2pcb
  inspice
  simp-sexp
)
depends=(
  bash
  python
  "${_py_deps[@]/#/python-}"
)
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools
)
optdepends=('kicad-library: part libraries')
provides=(${pkgname} ${_name})
conflicts=(${pkgname} ${_name})
options=('!emptydirs' '!strip' '!debug')
install=
# source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
source=("${_name}-${pkgver}.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0dbb3ef748ff3b83313b4cf03c5d8b3e2eb82007657d2b077d1b7bdc94472464')

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 /dev/stdin ${pkgdir}/etc/profile.d/${pkgname}.sh <<EOF
#!/bin/sh

if [ -d /usr/share/kicad/symbols/ ]; then
  export KICAD_SYMBOL_DIR="/usr/share/kicad/symbols"
fi

export PATH
EOF
}
