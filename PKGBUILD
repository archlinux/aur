# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.56.0
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
  'c94c20861e83488ef13c05af9951fbe175ceebe3bf21ab7024f6e40ee822d143'
  '616da015778d41138d6e5d3edae95159d1a06df1d162b98f90cd3048ad91e62b'
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
