# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=webmacs-git
pkgver=r525.0fa0010
pkgrel=1
_pythonver=3.6
pkgdesc="browser for keyboard-based web navigation"
arch=('x86_64')
url="https://github.com/parkouss/webmacs"
license=('GPL3')
depends=('python-pyqt5' 'qt5-webengine' 'python-dateparser' 'python-dateutil')
makedepends=('python-setuptools' 'python-sphinx' 'git')
source=("git+https://github.com/parkouss/webmacs")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.vendor.url "$srcdir"/vendor
  git config submodule.c.url "$srcdir"/c
  git submodule update
}

build() {
  cd "${pkgname%-git}"
  python setup.py build
}

package() {
  cd "${pkgname%-git}"
  python setup.py install --root="$pkgdir/" --optimize=1
  rm -rf "$pkgdir"/usr/lib/python${_pythonver}/site-packages/{ruamel,tzlocal,six.py,test_regex.py,pytz,regex*}
  install -d "$pkgdir"/usr/bin/
}
