# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Sebastien Binet <binet@lblbox>

pkgbase=python-ptrace
pkgname=('python-ptrace' 'python2-ptrace')
pkgver=0.8.1
pkgrel=1
pkgdesc="Python binding of ptrace library to trace processes and syscalls."
url="http://bitbucket.org/haypo/python-ptrace"
arch=('any')
license=('GPL2')
makedepends=('python' 'python2')
source=("http://pypi.python.org/packages/source/p/${pkgbase}/${pkgbase}-${pkgver}.tar.gz")
sha256sums=('779e04c7bdc00150b739e7d49c9c61b7f36f17afd26355f91b10cd0e7d55d19f')

prepare(){
  cp -dpr --no-preserve=owner "${pkgbase}-${pkgver}" "python2-ptrace-${pkgver}"
}

build() {
  # Build Python 3.x module
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
  # Build Python 2.x module
  cd "${srcdir}/python2-ptrace-${pkgver}"
  python2 setup.py build
}

package_python-ptrace() {
  depends=('python')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

package_python2-ptrace() {
  depends=('python2')
  cd "${srcdir}/python2-ptrace-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Rename gdb and strace scripts to avoid names conflict
  mv "${pkgdir}/usr/bin/gdb.py" "${pkgdir}/usr/bin/gdb2.py"
  mv "${pkgdir}/usr/bin/strace.py" "${pkgdir}/usr/bin/strace2.py"
}
