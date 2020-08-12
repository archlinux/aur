# Maintainer: Chris Tam <LChris314 at gmail dot com>

pkgname=python-pyperclip-git
pkgver=r197.d72f3ce
pkgrel=1
pkgdesc="A cross-platform clipboard module for Python (git)"
arch=('any')
url="https://github.com/asweigart/pyperclip"
license=('BSD')
makedepends=('python-setuptools')
# GTK/Qt tests crash xvfb, and Klipper tests require a running klipper
checkdepends=('xorg-server-xvfb' 'python-pytest' 'xsel' 'xclip')
depends=('python')
optdepends=('xclip: xclip backend'
            'xsel: xsel backend'
            'plasma-workspace: klipper backend')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("pyperclip::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd pyperclip
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd pyperclip
  python setup.py build
}

check() {
  cd pyperclip
  PYTHONPATH="${PWD}/build/lib:${PYTHONPATH}" xvfb-run py.test
}

package() {
  cd pyperclip
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
