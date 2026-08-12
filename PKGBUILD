# Maintainer: Julian Houba <info@craftingdragon.ch>
_pkgname_base=opengrep
pkgname=${_pkgname_base}-bin
pkgver=1.27.0
pkgrel=1
_interfaces_commit=977c2a9b30e472c303930104414184c76bbadda8
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

sha256sums=('40d61828a8525ea34b8f0ada203e36a74a430e55bcdb4192be10a06f8a4dc72b'
            '5a9b104aa3fc30a3e8f74cd165bbab49bfe9868a496977a13f2531137dd2d6a3')
sha256sums_x86_64=('fda5bcfa3e576bb08033d1195636a01eb2c95e16ab8906145cdfa6ce49bcdaec')
sha256sums_aarch64=('c031e7f82f35c362ceb246df9e576e16d1ce346cb86503fc0d292a7c3ade4bda')

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
