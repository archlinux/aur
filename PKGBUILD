# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-grequests-git
pkgver=20140618
pkgrel=1
pkgdesc="Allows you to use Requests with Gevent to make asyncronous HTTP Requests easily"
arch=('any')
depends=('python2' 'python2-greenlet')
makedepends=('cython2' 'git' 'python2-setuptools')
url="https://github.com/natecode/grequests"
license=('ISC')
source=(${pkgname%-git}::git+https://github.com/natecode/grequests#commit=ea00e193074fc11d71b4ff74138251f6055ca364)
sha256sums=('SKIP')
provides=('python2-grequests')
conflicts=('python2-grequests')

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

  msg 'Installing license...'
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"

  msg 'Installing...'
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
