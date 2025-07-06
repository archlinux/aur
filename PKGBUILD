pkgname=capstone-git
pkgver=20250706.5292.56db8c2b6
pkgrel=1
pkgdesc="A lightweight multi-platform, multi-architecture disassembly framework."
arch=('i686' 'x86_64')
url="http://www.capstone-engine.org/"
license=('BSD')
makedepends=('git')
# if you want the bindings uncomment the appropriae line below, and
# comment out the line above
#makedepends=('git' 'python')
optdepends=('python: for python3 bindings')
provides=('capstone')
conflicts=('capstone')

source=("${pkgname}::git+https://github.com/capstone-engine/capstone.git#branch=next")
md5sums=('SKIP')

pkgver () {
  cd "${srcdir}/${pkgname}"
  _date=`date +"%Y%m%d"`
  echo "$_date.$(git rev-list --count makepkg).$(git rev-parse --short makepkg)"
  #git log -1 --date=short --format="%cd.%h" | tr -d -
}

build() {
  cd ${srcdir}/${pkgname}
  cmake -B build -DCMAKE_BUILD_TYPE=Release -DCAPSTONE_BUILD_CSTEST=ON -DCAPSTONE_BUILD_SHARED_LIBS=ON
  cmake --build build

  # uncomment as approriate
  #cd bindings/python
  #python setup.py build -b ./build/py3
}

check() {
  cd ${srcdir}/${pkgname}
  build/suite/cstest/cstest tests

  # uncomment as needed
  #cd bindings/python
  #local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
  #PYTHONPATH="$PWD/build/py3/lib.linux-$CARCH-cpython-$python_version" python tests/test_all.py
}

package() {
  cd ${srcdir}/${pkgname}
  #make DESTDIR="${pkgdir}" install
  cmake --install build --prefix ${pkgdir}
  install -d -m755 ${pkgdir}/usr/share/licenses/capstone-git
  install LICENSES/LICENSE.TXT ${pkgdir}/usr/share/licenses/capstone-git/LICENSE.TXT

  # uncomment as needed
  #cd ${srcdir}/${pkgname}/bindings/python
  #python setup.py install --root ${pkgdir}
}
# vim:set ts=2 sw=2 et:
