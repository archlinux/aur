# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.111.1
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
  '0f88519d250e89e2538d5eb2011e03fc434012b58c4aeb7d49d747ae193dd494'
  'bed4cec050fe662a52478a0cfe783e5da44f69821ddb8d59cc848270c141c74b'
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
