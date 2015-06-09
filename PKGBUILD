# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=csv2html-git
pkgver=20140504
pkgrel=1
pkgdesc="Convert CSV files into HTML tables or complete HTML documents"
arch=('any')
depends=('python2' 'python2-html')
makedepends=('git' 'python2-setuptools')
url="https://github.com/dbohdan/csv2html"
license=('BSD')
source=(git+https://github.com/dbohdan/csv2html)
sha256sums=('SKIP')
provides=('csv2html')
conflicts=('csv2html')

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
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Installing documentation...'
  install -Dm 644 README.md "$pkgdir/usr/share/doc/${pkgname%-git}/README.md"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  rm -f "$pkgdir/usr/"{LICENSE,README.md}
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
