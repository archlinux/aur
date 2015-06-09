# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=ledger.py-git
pkgver=20140904
pkgrel=1
pkgdesc="Command-line, double-entry accounting system written in Python, inspired by Ledger"
arch=('any')
depends=('python2' 'python2-dateutil' 'python2-xlwt')
makedepends=('git')
url="https://github.com/mafm/ledger.py"
license=('GPL3')
source=(git+https://github.com/mafm/ledger.py)
sha256sums=('SKIP')
provides=('ledger.py')
conflicts=('ledger.py')
install=ledger.py.install

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg 'Fixing Python version...'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/python#/usr/bin/python2#g'
  find . -type f -print0 | xargs -0 sed -i 's#/usr/bin/env python#/usr/bin/env python2#g'
}

package() {
  cd ${pkgname%-git}

  msg 'Installing license...'
  install -Dm 644 COPYING $pkgdir/usr/share/licenses/ledger.py/COPYING
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/ledger.py/LICENSE

  msg 'Installing documentation...'
  install -dm 755 $pkgdir/usr/share/doc/ledger.py
  tar -c doc examples README.md | tar -x -C $pkgdir/usr/share/doc/ledger.py

  msg 'Installing tests...'
  install -dm 755 $pkgdir/usr/share/ledger.py
  for _file in test_ledger.py; do
    cp -R $_file $pkgdir/usr/share/ledger.py/$_file
  done

  msg 'Installing executable...'
  install -Dm755 ledger.py $pkgdir/usr/share/ledger.py/ledger.py

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
