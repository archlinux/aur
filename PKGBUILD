pkgname=nyx-git
_pkgname=nyx
pkgver=2.1.0+8+g6999660
pkgrel=1
pkgdesc='Command-line status monitor for tor'
url='https://nyx.torproject.org/'
arch=('any')
license=('GPL3')
depends=('python' 'python-setuptools' 'python-stem' 'net-tools' 'procps-ng' 'lsof')
optdepends=('tor: tor-server to talk to')
provides=('nyx')
conflicts=('nyx')
source=("git+https://git.torproject.org/nyx.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed 's/-/+/g'
}


prepare() {
  cd ${_pkgname}
  # remove tests requiring full terminal
  rm -r test/{panel,{popups,subwindow,installation}.py}
  # make test exit on error
  sed -E 's|(test_runner.run\(tests\))|__import__("sys").exit(0 if \1.wasSuccessful() else 1)|' -i run_tests.py
}

build() {
  cd ${_pkgname}
  python setup.py build
}

check() {
  cd ${_pkgname}
  ./run_tests.py
}

package() {
  cd ${_pkgname}
  python setup.py install --optimize=1 --root="${pkgdir}" --skip-build
  install -Dm 644 nyx.1 -t "${pkgdir}/usr/share/man/man1"
}

# vim: ts=2 sw=2 et:
