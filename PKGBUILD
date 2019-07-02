pkgname=capstone-git
pkgver=20190702.4335.626bd6ab
pkgrel=1
pkgdesc="A lightweight multi-platform, multi-architecture disassembly framework."
arch=('i686' 'x86_64')
url="http://www.capstone-engine.org/"
license=('BSD')
makedepends=('git')
# if you want the bindings uncomment the appropriae line below, and
# comment out the line above
#makedepends=('git' 'python2' 'python')
#makedepends=('git' 'python')
#makedepends=('git' 'python2')
optdepends=('python: for python3 bindings'
            'python2: for python2 bindings')
provides=('capstone')
conflicts=('capstone')

source=("${pkgname}::git+https://github.com/aquynh/capstone.git#branch=next")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  _date=`date +"%Y%m%d"`
  echo "$_date.$(git rev-list --count makepkg).$(git rev-parse --short makepkg)"
  #git log -1 --date=short --format="%cd.%h" | tr -d -
}

build() {
  cd ${srcdir}/${pkgname}
  make

  # uncomment as approriate
  #cd "./bindings/python"
  #python2 setup.py build -b ./build/py2
  #python setup.py build -b ./build/py3
}

check() {
  cd "${srcdir}/${pkgname}"
  LD_PRELOAD="./tests/libcapstone.so" make check

  # uncomment as needed
  #cd "./bindings/python"
  #python test_basic.py
  #python2 test_basic.py
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR="${pkgdir}" install
  install -d -m755 ${pkgdir}/usr/share/licenses/capstone-git
  install LICENSE.TXT ${pkgdir}/usr/share/licenses/capstone-git/LICENSE.TXT

  # uncomment as needed
  #cd ${srcdir}/${pkgname}/bindings/python
  #python2 setup.py install --root ${pkgdir}
  #python setup.py install --root ${pkgdir}
}
# vim:set ts=2 sw=2 et:
