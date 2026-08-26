# Maintainer: Julian Houba <info@craftingdragon.ch>
_pkgname_base=opengrep
pkgname=${_pkgname_base}-bin
pkgver=1.28.0
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

sha256sums=('0ecab878a36ebe44f7c405a32a4d1aad3ef308ea270bb9fcad75fb554c0d43f7'
            '60a283e9a840f1be891ff0ab4794ba7555b443b8415be12bdcf4f92433329e66')
sha256sums_x86_64=('b6708ec2751556dc5a6ce620cea85e387389f9c9148a81e6ed1fd8b054be7c73')
sha256sums_aarch64=('f382781342875062f98f62d4d9189b7c4ffaffb91a1779c3848a4ce70762fe67')

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
