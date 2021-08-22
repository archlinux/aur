# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.62.0
pkgrel=1
pkgdesc="Fast and syntax-aware semantic code pattern search for many languages: like grep but for code"
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL2.1)
makedepends=('python-setuptools' 'python-wheel')
depends=('python' 'python-attrs' 'python-colorama' 'python-junit-xml' 'python-requests' 'python-ruamel-yaml' 'python-tqdm' 'python-packaging' 'python-jsonschema')
provides=('semgrep')
options=('!strip')
source=(
  "https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz"
  "https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
)
sha256sums=(
  'ea48f88f4a45c8e32e9f4eec3b5a8f07c011ec4f082ad96d4f8d87c109156839'
  '5b04fde7fdc880b541200c071ad00d26192494448cea812899b89a32e31518db'
)
# https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz.sha256

build() {
  cd "$srcdir/${_name}-${pkgver}"
  export SEMGREP_CORE_BIN="${srcdir}/semgrep-files/semgrep-core"
  export SPACEGREP_BIN="${srcdir}/semgrep-files/spacegrep"
  python setup.py build
  chmod +x build/lib/semgrep/bin/{semgrep-core,spacegrep}
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  # solve conflict with python-hypothesis
  rm -rf "${pkgdir}/usr/lib/python3.8/site-packages/tests"
}
