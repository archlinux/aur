# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: eolianoe <eolianoe [at] googlemail [dot] com>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Étienne Deparis <etienne [at] depar [dot] is>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>

pkgname=khal-git
_pkgname=khal
pkgver=0.10.6.dev26+gdc6d5a1
pkgrel=1
pkgdesc='CLI calendar application build around CalDAV (Git)'
arch=('any')
url="https://lostpackets.de/khal/"
license=('MIT')
makedepends=('git' 'python-setuptools-scm' 'python-sphinxcontrib-newsfeed')
depends=('python-atomicwrites' 'python-click' 'python-click-log'
'python-configobj' 'python-dateutil' 'python-icalendar' 'python-pytz'
'python-setuptools' 'python-tzlocal' 'python-urwid' 'python-xdg')
optdepends=('python-setproctitle: Set process name'
            'vdirsyncer: Synchronize CalDAV calendars')
checkdepends=('python-pytest' 'python-freezegun' 'vdirsyncer' 'python-hypothesis')
source=("${_pkgname}::git+https://github.com/pimutils/khal.git")
sha256sums=('SKIP')
provides=('khal')
conflicts=('khal')
options=(!emptydirs)

pkgver() {
  cd "$srcdir/${_pkgname}"
  python setup.py --version
}

build() {
  cd "$srcdir/${_pkgname}"
  python setup.py build
  make -C doc man PYTHONPATH="${PWD}"
}

check() {
  cd "$srcdir/${_pkgname}"
  pytest -v
}

package() {
  cd "$srcdir/${_pkgname}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  # executables
  install -vDm 755 bin/{i,}"${_pkgname}" -t "$pkgdir/usr/bin/"
  # configuration
  install -vDm 644 "${_pkgname}.conf.sample" \
    "${pkgdir}/usr/share/doc/${_pkgname}/examples/${_pkgname}.conf"
  # man page
  install -vDm 644 doc/build/man/${_pkgname}.1 \
    -t "${pkgdir}/usr/share/man/man1/"
  # license
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}"
  # docs
  install -vDm 644 {AUTHORS.txt,{CHANGELOG,CONTRIBUTING,README}.rst} \
    -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
