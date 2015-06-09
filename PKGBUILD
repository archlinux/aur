# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Daniel O'Neel <danieloneel at gmail dot com>

pkgname=geturl-git
pkgver=20130826
pkgrel=1
pkgdesc="A CLI tool to get a public link for any file"
arch=('any')
depends=('python2')
makedepends=('git' 'python2-setuptools')
optdepends=('xclip: copy to clipboard'
            'xsel: copy to clipboard')
url="https://github.com/uams/geturl"
license=('MIT')
source=(git+https://github.com/uams/geturl)
sha256sums=('SKIP')
provides=('geturl')
conflicts=('geturl')

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

  msg "Building..."
  python2 setup.py build
}

package() {
  cd ${pkgname%-git}

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1

  msg 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
}
