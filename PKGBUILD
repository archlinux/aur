# $Id: PKGBUILD 207928 2017-01-18 21:39:02Z jelle $
# Maintainer:  Laurent Soest <laurent.soest@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Armando M. Baratti <amblistas@ajato.com.br>
# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=('python-cherrypy' 'python2-cherrypy')
pkgver=11.0.0
pkgrel=1
pkgdesc="A pythonic, object-oriented web development framework"
arch=('any')
url="http://www.cherrypy.org"
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-setuptools-scm' 'python2-setuptools-scm')
checkdepends=('python-tox' 'python2-tox')
source=("https://github.com/cherrypy/cherrypy/archive/v$pkgver.tar.gz")
md5sums=('bb432eb2e919d449a1f644b36b8db4f1')

build() {
  cp -r "${srcdir}/cherrypy-${pkgver}" "${srcdir}/cherrypy-${pkgver}-py2"

  # setuptools wont find version from git tag
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  cd "${srcdir}/cherrypy-${pkgver}"
  python ./setup.py build

  cd "${srcdir}/cherrypy-${pkgver}-py2"
  python2 ./setup.py build
}

package_python-cherrypy() {
  depends=('python')

  cd cherrypy-${pkgver}

  python ./setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE.md \
    "${pkgdir}/usr/share/licenses/python-cherrypy/LICENSE.md"
}

package_python2-cherrypy() {
  depends=('python2')

  cd cherrypy-${pkgver}-py2

  python2 ./setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}/usr/bin/cherryd" "${pkgdir}/usr/bin/cherryd2"

  install -Dm644 LICENSE.md \
    "${pkgdir}/usr/share/licenses/python2-cherrypy/LICENSE.md"
}

check() {
  cd cherrypy-${pkgver}-py2
  tox2

  cd $srcdir/cherrypy-${pkgver}
  tox
}
