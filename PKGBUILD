# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=webmacs-git
pkgver=r791.35f1743
pkgrel=5
_pythonver=3.9
pkgdesc="browser for keyboard-based web navigation"
arch=('x86_64')
url="https://github.com/parkouss/webmacs"
license=('GPL3')
depends=('python-pyqt5' 'qt5-webengine' 'python-dateparser' 'python-dateutil' 'python-jinja'
	 'python-pyqt5-webengine' 'python-importlib-metadata')
makedepends=('python-setuptools' 'python-sphinx' 'git')
source=("git+https://github.com/parkouss/webmacs" minibuffer.patch)
md5sums=('SKIP'
         '32db2257938f42f94ca0183e02410125')

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
  git apply "$srcdir"/minibuffer.patch
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
