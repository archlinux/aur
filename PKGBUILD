# Maintainer: Julian Houba <info@craftingdragon.ch>
_pkgname_base=opengrep
pkgname=${_pkgname_base}-bin
pkgver=1.27.1
pkgrel=1
_interfaces_commit=5e705660dc7381d4c4c247fa83c4c5860e61d555
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

sha256sums=('a2bd9f9d596a2e5b5c73ada4caf5175ecae2fb91d6caa5e7d5e249f5be1b7884'
            '60a283e9a840f1be891ff0ab4794ba7555b443b8415be12bdcf4f92433329e66')
sha256sums_x86_64=('8400d91cc6b0d05a8b68de01e5ad818f580e695a4267a12255129d83683e80a9')
sha256sums_aarch64=('3c2625f4fc2e23a405e8f37c47e41ca0f4f309f199d1870f4a0522360f886b64')

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
