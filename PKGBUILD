# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Bruno Pagani <archange@archlinux.org>

_pkg=krb5
pkgname=python38-${_pkg}
pkgver=0.4.1
pkgrel=1
pkgdesc="krb5 API interface"
arch=(x86_64)
url="https://github.com/jborean93/pykrb5"
license=(MIT)
depends=(python38 krb5)
makedepends=(cython python38-setuptools)
checkdepends=(python38-pytest python38-k5test)
# No tests in pypi tarball
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('fc7329c91eff254f46d01088995e12127844a79bcaac14ba29cbd7ec6bcbdd37')

build() {
  cd py${_pkg}-${pkgver}
  python3.8 setup.py build
}

check() {
  cd py${_pkg}-${pkgver}
  local python_version=$(python3.8 -m 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  PYTHONPATH="${PWD}"/build/lib.linux-$CARCH-cpython38-${python_version/./} pytest -vv --color=yes
}

package() {
  cd py${_pkg}-${pkgver}
  python3.8 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
