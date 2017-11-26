# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgbase=python-argcomplete
pkgname=('python-argcomplete' 'python2-argcomplete')
_pyname=argcomplete
pkgver=1.9.3
pkgrel=1
pkgdesc='Easy, extensible command line tab completion of arguments for your Python script'
url='https://github.com/kislyuk/argcomplete'
arch=('any')
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pexpect' 'python2-pexpect' 'tcsh')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kislyuk/${_pyname}/archive/v${pkgver}.tar.gz)
sha256sums=('3f0f2465bc6a36364bfaebea0740e0ec3027b13b355522e812fa9afd94b0b4b2')
sha512sums=('6f793b1f34df171478af2c477b5ddeff3f44a4c08d1a9205cff19fcc97e65d19a39ddd5c1d7653a70c738507ee1fb5603c437e16e64b3943a87247426bd270b6')

prepare() {
  cp -a ${_pyname}-${pkgver}{,-py2}
}

build() {
  (cd ${_pyname}-${pkgver}
    python setup.py build
  )
  (cd ${_pyname}-${pkgver}-py2
    python2 setup.py build
  )
}

check() {
  (cd ${_pyname}-${pkgver}
    LC_CTYPE=en_US.UTF-8 python test/test.py -v
  )
  (cd ${_pyname}-${pkgver}-py2
    LC_CTYPE=en_US.UTF-8 python2 test/test.py -v
  )
}

package_python-argcomplete() {
  depends=('python')

  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --skip-build
}

package_python2-argcomplete() {
  depends=('python2')

  cd ${_pyname}-${pkgver}-py2
  python2 setup.py install -O1 --root="${pkgdir}" --skip-build
  mv "${pkgdir}/usr/bin/activate-global-python-argcomplete" \
    "${pkgdir}/usr/bin/activate-global-python2-argcomplete"
  mv "${pkgdir}/usr/bin/python-argcomplete-check-easy-install-script" \
    "${pkgdir}/usr/bin/python2-argcomplete-check-easy-install-script"
  mv "${pkgdir}/usr/bin/register-python-argcomplete" \
    "${pkgdir}/usr/bin/register-python2-argcomplete"
  mv "${pkgdir}/usr/bin/python-argcomplete-tcsh" \
    "${pkgdir}/usr/bin/python2-argcomplete-tcsh"
}

# vim: ts=2 sw=2 et:
