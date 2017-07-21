# $Id: PKGBUILD 207928 2017-01-18 21:39:02Z jelle $
# Maintainer: Angel Velasquez <angvp@archlinux.org> 
# Contributor: Kaiting Chen <kaitocracy@gmail.com>
# Contributor: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: Armando M. Baratti <amblistas@ajato.com.br>
# Contributor: Florian Richter <Florian_Richter@gmx.de>
pkgname=('python-cherrypy' 'python2-cherrypy')
pkgver=8.9.1
pkgrel=1
pkgdesc="A pythonic, object-oriented web development framework"
arch=('any')
url="http://www.cherrypy.org"
license=('BSD')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-mock' 'python2-mock' 'python-nose')
source=("https://pypi.python.org/packages/56/aa/91005730bdc5c0da8291a2f411aacbc5c3729166c382e2193e33f28044a3/CherryPy-8.9.1.tar.gz")
md5sums=('7abe5198e48f14cfee57a07d23875a4b')

build() {
  cp -r CherryPy-${pkgver} CherryPy-${pkgver}-py2

  cd CherryPy-${pkgver}
  python ./setup.py build

  cd "${srcdir}/CherryPy-${pkgver}-py2"
  python2 ./setup.py build
}

package_python-cherrypy() {
  depends=('python' 'python-six')

  cd CherryPy-${pkgver}

  python ./setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 LICENSE.md \
    "${pkgdir}/usr/share/licenses/python-cherrypy/LICENSE.md"
}

package_python2-cherrypy() {
  depends=('python2')

  cd CherryPy-${pkgver}-py2

  python2 ./setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}/usr/bin/cherryd" "${pkgdir}/usr/bin/cherryd2"

  install -Dm644 LICENSE.md \
    "${pkgdir}/usr/share/licenses/python2-cherrypy/LICENSE.md"
}

check() {
  # backports.unittest_mock is not packaged..
  cd CherryPy-${pkgver}-py2/cherrypy
  #LANG="en_US.UTF-8" pytest2 test/

  cd $srcdir/CherryPy-${pkgver}/cherrypy
  LANG="en_US.UTF-8" nosetests test/

}
