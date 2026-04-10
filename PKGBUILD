# Maintainer: Julian Houba <info@craftingdragon.ch>
pkgname=opengrep
pkgver=1.19.0
pkgrel=1
_interfaces_commit=e0777714cf175fda0dd9fa679f044cefbc983a13
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code. Fork of semgrep"
arch=('x86_64' 'aarch64')
url="https://github.com/opengrep/opengrep"
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
  "opengrep-core_linux_x86.tar.gz::https://github.com/opengrep/opengrep/releases/download/v${pkgver}/opengrep-core_linux_x86.tar.gz"
)
source_aarch64=(
  "opengrep-core_linux_aarch64.tar.gz::https://github.com/opengrep/opengrep/releases/download/v${pkgver}/opengrep-core_linux_aarch64.tar.gz"
)

sha256sums=('f7bdf40454f07babccd2574fe8b9fc9f53010df51d247920a950aa320657fa41'
            'b3c613800d530257c0b57197f7b33d440a340c7067a4844a8b845383f038135b')
sha256sums_x86_64=('4bee4161dbc50c3dfc4a627b3971ac518f39c061513aa398cb81ff5daab6dc4c')
sha256sums_aarch64=('5a93f5c039fcf5f0ad2474f1d212e8cbd3039628c868046623247c0dafedc821')

prepare() {
  cd "${pkgname}-${pkgver}"
  
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
  cd "${pkgname}-${pkgver}/cli"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}/cli"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  
  cd ..
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
