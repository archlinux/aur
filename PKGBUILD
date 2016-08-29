# Maintainer: eolianoe <eolianoe [at] googlemail [dot] com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Étienne Deparis <etienne [at] depar [dot] is>

pkgname=khal
pkgver=0.8.3
pkgrel=1
pkgdesc='CLI calendar application build around CalDAV'
arch=('any')
url='http://lostpackets.de/khal/'
license=('MIT')
makedepends=('python-setuptools-scm' 'python-sphinxcontrib-newsfeed')
depends=('python-urwid' "vdirsyncer>=0.5.2" "python-tzlocal>=1.0"
         "python-click>=3.2" 'python-configobj' "python-icalendar>=3.9.2" 'python-xdg'
         'python-pkginfo')
optdepends=('python-setproctitle')
checkdepends=('python-pytest' 'python-freezegun')
source=("https://lostpackets.de/khal/downloads/khal-${pkgver}.tar.gz")
sha256sums=('1ec6940a9fbd207c41428b103bac1d1555129b9b4eca2b843c544bd48ac63ee3')

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
  cd "$srcdir/$pkgname-$pkgver"

  if [ "${LANG}" == "C" ]
  then
    export LANG=$(locale -a | grep utf8 | head -n1)
  fi
  py.test
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
