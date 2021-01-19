# Maintainer: Aloxaf <aloxafx@gmail.com>

pkgname=semgrep-bin
_name=semgrep
pkgver=0.37.0
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
  'ebe1b1465d3db22419d7df772dd13884a5364654dc548d1af73b13933b758522'
  'adbf544bbe99ee32cc0ca40b230c0b2a5f3e04a6bc6ad4086aedb096e61c6e5e'
)
# https://github.com/returntocorp/semgrep/releases/download/v${pkgver}/semgrep-v${pkgver}-ubuntu-16.04.tgz.sha256

build() {
  cd "$srcdir/${_name}-${pkgver}"
  sed -i 's/ruamel.yaml==0.16.10/ruamel.yaml>=0.16.10/' setup.py
  SEMGREP_SKIP_BIN=1 python setup.py build
  chmod +x build/lib/semgrep/bin/{semgrep-core,spacegrep}
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  SEMGREP_CORE_BIN="${srcdir}/semgrep-files/semgrep-core" \
  SPACEGREP_BIN="${srcdir}/semgrep-files/spacegrep" \
    python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

  # solve conflict with python-hypothesis
  rm -rf "${pkgdir}/usr/lib/python3.8/site-packages/tests"
}
