# Maintainer: eolianoe <eolianoe [at] googlemail [dot] com>
# Co-Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Étienne Deparis <etienne [at] depar [dot] is>
# Contributor: Daniel M. Capella <polyzen@archlinux.info>

pkgname=khal
pkgver=0.9.8
pkgrel=1
pkgdesc='CLI calendar application build around CalDAV'
arch=('any')
url='http://lostpackets.de/khal/'
license=('MIT')
makedepends=('python-setuptools-scm' 'python-sphinx')
depends=('python-urwid' "python-tzlocal>=1.0"
         "python-click>=3.2" 'python-configobj' "python-icalendar>=3.9.2" 'python-xdg'
         'python-pkginfo')
optdepends=('python-setproctitle' 'vdirsyncer')
checkdepends=('python-pytest' 'python-freezegun' 'vdirsyncer')
source=("https://lostpackets.de/khal/downloads/khal-${pkgver}.tar.gz")
sha256sums=('fe049e1ed3238461c108f7ef4abba09f46130f77f0e2b80418529f6dfb1b9dae')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # Delete references to the RSS feed, so we can avoid the extra checkdepends:
  sed -i '/newsfeed/d' doc/source/conf.py
  sed -i '/news/d' doc/source/index.rst
  rm -r doc/source/news*
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build

  cd "$srcdir/$pkgname-$pkgver/doc"
  make man PYTHONPATH="$srcdir/$pkgname-$pkgver"
}

check() {
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
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -D -m644 khal.conf.sample "${pkgdir}/usr/share/doc/${pkgname}/examples/khal.conf"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -D -m644 doc/build/man/khal.1 "${pkgdir}/usr/share/man/man1/khal.1"
  install -Dm 755 bin/khal "$pkgdir/usr/bin/khal"
  install -Dm 755 bin/ikhal "$pkgdir/usr/bin/ikhal"

  # You can comment the following to disable zsh completion (if you do
  # not plan to use zsh for example)
  install -D -m644 misc/__khal "${pkgdir}/usr/share/zsh/site-functions/_khal"
}
