# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.104.0
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
  'python-defusedxml' 'python-urllib3'
)
provides=('semgrep')
options=('!strip')
source=(
  "https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz"
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  '182105b5b4b337fd9abc5b61a734cc783a4711fdecf6e6b47e6b5ce4a49a67ce'
  'f84dcfb55b63fb4b91a63f284da2447329fbdeaffd912f0ac44b2e3b456decdc'
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
