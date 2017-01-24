# Maintainer: eolianoe <eolianoe [at] googlemail [dot] com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Étienne Deparis <etienne [at] depar [dot] is>

pkgname=khal
pkgver=0.9.0
pkgrel=0
pkgdesc='CLI calendar application build around CalDAV'
arch=('any')
url='http://lostpackets.de/khal/'
license=('MIT')
makedepends=('python-setuptools-scm' 'python-sphinxcontrib-newsfeed')
depends=('python-urwid' "python-tzlocal>=1.0"
         "python-click>=3.2" 'python-configobj' "python-icalendar>=3.9.2" 'python-xdg'
         'python-pkginfo')
optdepends=('python-setproctitle' 'vdirsyncer')
checkdepends=('python-pytest' 'python-freezegun')
source=("https://lostpackets.de/khal/downloads/khal-${pkgver}.tar.gz")
sha256sums=('b9aa992a8ed1a5d816eeeff79256ad7edea591acdf16ae30e65bfdc3adef0f8d')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build

  cd "$srcdir/$pkgname-$pkgver/doc"
  make man PYTHONPATH="$srcdir/$pkgname-$pkgver"
}

check() {
  return 0
  cd "$srcdir/$pkgname-$pkgver"

  # When using a clean chroot,
  # one has to choose a proper locale to run the tests
  if [ "${LANG}" == "C" ]; then
    LANG=$(locale -a | grep utf8 | head -n1) py.test
  else
    py.test
  fi
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -D -m644 khal.conf.sample "${pkgdir}/usr/share/doc/${pkgname}/examples/khal.conf"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 doc/build/man/khal.1 "${pkgdir}/usr/share/man/man1/khal.1"

  # You can comment the following to disable zsh completion (if you do
  # not plan to use zsh for example)
  install -D -m644 misc/__khal "${pkgdir}/usr/share/zsh/site-functions/_khal"
}
