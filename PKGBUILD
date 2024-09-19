# Maintainer: Caleb Jamison <cbjamo@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=python-skidl
_name=${pkgname#python-}
pkgver=1.2.3
pkgrel=3
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
sha256sums=('ed4c124651a8587787eb828d0dd6e46fc5ffe7d6fa013d8e664c21624b466bd9')

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
