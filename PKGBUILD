# Maintainer: Julian Houba <info@craftingdragon.ch>
_pkgname_base=opengrep
pkgname=${_pkgname_base}-bin
pkgver=1.23.0
pkgrel=1
_interfaces_commit=e0777714cf175fda0dd9fa679f044cefbc983a13
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code. Fork of semgrep (binary release)"
arch=('x86_64' 'aarch64')
url="https://github.com/opengrep/opengrep"
provides=("${_pkgname_base}=${pkgver}")
conflicts=("${_pkgname_base}")
options=(!strip)
license=('LGPL-2.1-only')

depends=(
  'python'
  'python-attrs'
  'python-boltons'
  'python-click-option-group'
  'python-click'
  'python-colorama'
  'python-glom'
  'python-jsonschema'
  'python-packaging'
  'python-peewee'
  'python-requests'
  'python-rich'
  'python-ruamel-yaml'
  'python-typing_extensions'
  'python-urllib3'
  'python-wcmatch'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/opengrep/opengrep/archive/refs/tags/v${pkgver}.tar.gz"
  "semgrep-interfaces-${_interfaces_commit}.tar.gz::https://github.com/opengrep/semgrep-interfaces/archive/${_interfaces_commit}.tar.gz"
)
source_x86_64=(
  "opengrep-core_linux_x86_v${pkgver}.tar.gz::https://github.com/opengrep/opengrep/releases/download/v${pkgver}/opengrep-core_linux_x86.tar.gz"
)
source_aarch64=(
  "opengrep-core_linux_aarch64_v${pkgver}.tar.gz::https://github.com/opengrep/opengrep/releases/download/v${pkgver}/opengrep-core_linux_aarch64.tar.gz"
)

sha256sums=('465d1b1cb23311328636373e895932dc5a12fee944ce61b7fe02cd24a0e6a133'
            'b3c613800d530257c0b57197f7b33d440a340c7067a4844a8b845383f038135b')
sha256sums_x86_64=('39ef9e12e3534b92df9eb67ebb0cd1bade2d3d42d70a5fb7888478441e19693e')
sha256sums_aarch64=('eb1bf7608ae91383055f066bdc287402e6f6cfeb2305a46bb10e2a193d4a3965')

prepare() {
  cd "${_pkgname_base}-${pkgver}"
  
  # Ensure the destination directory exists
  mkdir -p cli/src/semgrep/bin
  
  # Inject the pre-built opengrep-core binary into the source tree 
  # so the python wheel builds with it included.
  cp "${srcdir}/opengrep-core" cli/src/semgrep/bin/opengrep-core
  chmod +x cli/src/semgrep/bin/opengrep-core

  # Add semgrep-interfaces submodule manually since github archives don't include them
  rm -rf cli/src/semgrep/semgrep_interfaces
  cp -r "${srcdir}/semgrep-interfaces-${_interfaces_commit}" cli/src/semgrep/semgrep_interfaces
}

build() {
  cd "${_pkgname_base}-${pkgver}/cli"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname_base}-${pkgver}/cli"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  
  cd ..
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
