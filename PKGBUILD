# Maintainer: Andy Weidenbaum <archbaum@gmail.com>

pkgname=findx-git
pkgver=20141005
pkgrel=1
pkgdesc="Wrapper to extend the Unix find command"
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
url="https://github.com/drmikehenry/findx"
license=('unknown')
source=(git+https://github.com/drmikehenry/findx)
sha256sums=('SKIP')
provides=('ffg' 'ffx' 'findx' 'findx.py')
conflicts=('ffg' 'ffx' 'findx' 'findx.py')

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

build() {
  cd ${pkgname%-git}

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing documentation...'
  for _doc in README.rst; do
    install -Dm 644 $_doc "$pkgdir/usr/share/doc/findx/$_doc"
  done

  msg 'Installing'
  python2 setup.py install --root="${pkgdir}" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
