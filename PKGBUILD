# Maintainer: eolianoe <eolianoe [at] googlemail [dot] com>
# Contributor: Thomas Weißschuh <thomas t-8ch de>
# Contributor: Étienne Deparis <etienne [at] depar [dot] is>

pkgname=khal
pkgver=0.7.0
pkgrel=1
pkgdesc='CLI calendar application build around CalDAV'
arch=('any')
url='http://lostpackets.de/khal/'
license=('MIT')
makedepends=('python-setuptools_scm' 'python-sphinxcontrib-newsfeed')
depends=('python-urwid' 'vdirsyncer' 'python-tzlocal'
         'python-click' 'python-configobj' 'python-icalendar' 'python-xdg'
         'python-pkginfo')
optdepends=('python-setproctitle')
source=("http://pypi.python.org/packages/source/k/khal/khal-${pkgver}.tar.gz"
        fix_path.patch::'https://github.com/geier/khal/commit/ef65e7b75f2f6aee61433da2372345b86118f4f4.patch')
sha256sums=('c6b0c81df56133e4592f02d8e9b60702079da2affd1b09ba96358ccd8eec9402'
            '302d2c9e8ffe094033ae02dbc70f6f6c48cd6fb26da3a707d5c8975b75b3536f')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 < "$srcdir/fix_path.patch"

}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build

  cd "$srcdir/$pkgname-$pkgver/doc"
  make man PYTHONPATH="$srcdir/$pkgname-$pkgver"
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
