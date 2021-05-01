# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.49.0
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
  'bd3a330bf5df007a745bd35119cd2819b123a0ac7dd7cf3cb6b2a2f1c6a8157e'
  'cca38e34824bdf17aeae6e7a8fc3ce0ac441fec51b207783a469fff9994eb08b'
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
