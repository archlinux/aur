# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Andrey Mikhaylenko <neithere at gmail dot com>

pkgbase=python-argcomplete
pkgname=('python-argcomplete' 'python2-argcomplete')
_pyname=argcomplete
pkgver=1.9.2
pkgrel=1
pkgdesc='Easy, extensible command line tab completion of arguments for your Python script'
url='https://github.com/kislyuk/argcomplete'
arch=('any')
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pexpect' 'python2-pexpect' 'tcsh')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/kislyuk/${_pyname}/archive/v${pkgver}.tar.gz)
sha256sums=('35f5dfbd2a78f6f0d7c960711b572f2a1cc110137687ebf1f66f71a0291b4261')
sha512sums=('0af5c78045e5f513dab475b665150ee2bf67d66c306046753d80925398040d7c537381c5f89ffe83872dbd711012bbad0e610c57e37f5234ef51470b63a9da4d')

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
