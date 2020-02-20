# Maintainer: Kyle Keen < keenerd at gmail >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=bpython2
pkgver=0.18
pkgrel=3
pkgdesc='Fancy ncurses interface to the Python interpreter'
arch=('any')
url='https://bpython-interpreter.org/'
license=('MIT')
depends=('python2-pygments' 'python2-requests' 'python2-curtsies' 'python2-greenlet' 'python2-six')
optdepends=('python2-urwid: for bpython2-urwid'
            'python2-jedi: multiline completion'
            'python2-watchdog: module reloading')
makedepends=('python2-distribute')
#source=(https://bpython-interpreter.org/releases/bpython-${pkgver}.tar.gz)  # slow
#source=("https://github.com/bpython/bpython/archive/$pkgver-release.tar.gz")  # missing version data
source=("https://files.pythonhosted.org/packages/source/b/bpython/bpython-$pkgver.tar.gz")
md5sums=('a150a9ff3383013da1156dda4b44280d')

# python-watchdog optdep...

build() {
  cd "$srcdir/bpython-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/bpython-$pkgver"

  python2 setup.py install --root="$pkgdir" --optimize=0

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/bpython2/LICENSE"

  # conflicting files with bpython
  cd "$pkgdir/usr/bin/"
  mv bpython bpython2
  mv bpython-urwid bpython2-urwid
  mv bpython-curses bpython2-curses
  mv bpdb bpdb2

  cd "$pkgdir/usr/share/applications/"
  mv org.bpython-interpreter.bpython.desktop org.bpython-interpreter.bpython2.desktop
  sed -i 's/bpython/&2/' org.bpython-interpreter.bpython2.desktop

  cd "$pkgdir/usr/share/appinfo/"
  mv org.bpython-interpreter.bpython.appdata.xml org.bpython-interpreter.bpython2.appdata.xml
  sed -i 's/bpython/&2/' org.bpython-interpreter.bpython2.appdata.xml

  cd "$pkgdir/usr/share/pixmaps/"
  mv bpython.png bpython2.png
}
