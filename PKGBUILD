# Maintainer: Daniel Moch <daniel@danielmoch.com>
_name=pytest-vcr
pkgname=python-${_name}
pkgver=1.0.2
pkgrel=1
pkgdesc='Py.test plugin for managing VCR.py cassettes'
arch=('any')
url="https://github.com/ktosiek/pytest-vcr"
license=('MIT')
depends=(python-pytest python-vcrpy python-setuptools)
makedepends=(python-setuptools)
checkdepends=(python-pytest python-pytest-cov)
source=(${_name}-${pkgver}.tar.gz::${url}/archive/1.0.2.tar.gz
        disable-plugin-install-assertion.patch)
sha256sums=('8df1fd60668d639c88f6453ce25094b12b3b1903b23e83f49c8f859dbd75cbee'
            '2f18a5e216b9256ef237669893d66001953304f54cfaa513d5747b87e8721365')

prepare() {
  cd ${_name}-${pkgver}
  patch -p1 < ../disable-plugin-install-assertion.patch
}

build() {
  cd ${_name}-${pkgver}
  python setup.py build
}

check() {
  # Hack entry points by installing it
  cd ${_name}-${pkgver}
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.7/site-packages:$PYTHONPATH:$PWD/tests" py.test
}

package() {
  cd ${_name}-${pkgver}
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python ./setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim: set sts=2 sw=2 ft=PKGBUILD et:
