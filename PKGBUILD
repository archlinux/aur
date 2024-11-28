# Maintainer: Caleb Jamison <cbjamo@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-skidl
_name=${pkgname#python-}
pkgver=2.0.0
pkgrel=1
pkgdesc="A Python package for textually describing electronic circuit schematics."
arch=(any)
url="https://pypi.org/project/skidl"
license=('MIT')
groups=()
_py_deps=(
  deprecation
  future
  graphviz
  pygame
  # AUR
  kinet2pcb
  kinparse
  sexpdata
  pyspice)
depends=(
  bash
  python
  "${_py_deps[@]/#/python-}")
makedepends=(python-build
  python-installer
  python-wheel
  python-setuptools)
optdepends=('kicad-library: part libraries')
provides=(${_name})
conflicts=(${_name})
options=('!emptydirs' '!strip')
install=
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('f31d61aee16962aec71d3a882dce85a114a21f020a497416cd1b1fc1e25c95a7')

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
  export KICAD8_SYMBOL_DIR="/usr/share/kicad/symbols"
  export KICAD7_SYMBOL_DIR="/usr/share/kicad/symbols"
  export KICAD6_SYMBOL_DIR="/usr/share/kicad/symbols"
fi

export PATH
EOF
}
