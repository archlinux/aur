# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname='python2-pyopenssl'
_name="${pkgname#python2-}"
pkgver=21.0.0
pkgrel=4
pkgdesc='Wrapper module for OpenSSL, legacy Python 2 version'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=(
  'openssl'
  'python2>=2.7'
  'python2-six>=1.5.2'
  'python2-cryptography>=3.3'
)
makedepends=(
  'python2-setuptools'
)
checkdepends=(
  'python2-flaky'
  'python2-pretend'
  'python2-pytest>=3.0.1'
  'python2-pytest-runner'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/pyca/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('bad555b8b8faa60992aad779e9c9af27b132a894d4d3e59fb65f423770b31f278f5966127ca7cdcf42184cefe0c7d6fa94b84482d0e97089031e4e508d77c424')

prepare() {
  cd "${_tarname}"

  echo 'Disabling test_alpn_call_failure(self): fails because it calls the deprecated SSLv23_METHOD.'
  sed -e 's/\(    def test_alpn_call_failure(self):\)/    @pytest.mark.skip\n\1/' \
      -i tests/test_ssl.py
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
    cd "${_tarname}"
    echo 'Running tests...'
    echo '-- Using LC_ALL=C.UTF-8 locale to ensure UTF-8 filesystem encoding is used in Python 2'
    LC_ALL=C.UTF-8 python2 setup.py pytest
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
