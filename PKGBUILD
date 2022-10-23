# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.118.0
pkgrel=1
pkgdesc="Fast and syntax-aware semantic code pattern search for many languages: like grep but for code"
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL2.1)
makedepends=('python-setuptools' 'python-wheel')
depends=(
  'python' 'python-attrs' 'python-boltons' 'python-colorama' 'python-click'
  'python-click-option-group' 'python-glom' 'python-requests' 'python-ruamel-yaml'
  'python-tqdm' 'python-packaging' 'python-jsonschema' 'python-wcmatch' 'python-peewee'
  'python-defusedxml' 'python-urllib3' 'python-typing_extensions' 'python-lsp-jsonrpc'
)
provides=('semgrep')
options=('!strip')
source=(
  "https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz"
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  'a062b927ab9edaae00f9218b41c6c10619be72b5efba72388b9c2ae0d17e4dba'
  '0a38514a6926f0366629aa92e857ec191e34ce982cb828b01d94078a5d495a77'
)
# https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz.sha256

build() {
  cd "$srcdir/${_name}-${pkgver}"
  export SEMGREP_CORE_BIN="${srcdir}/semgrep-files/semgrep-core"
  # fix wcmatch version
  # sed -i 's/wcmatch==8.2/wcmatch>=8.2/' setup.py
  python setup.py build
  chmod +x build/lib/semgrep/bin/semgrep-core
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  # solve conflict with other packages
  rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests
}
