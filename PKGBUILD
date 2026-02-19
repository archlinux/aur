# Maintainer: Mike Pento <mjpento@gmail.com>

_python=python
_pkgname=python-efl
pkgname=$_python-efl-git
pkgver=1.26.99.a1292.g8d23f65
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries - Development Version"
arch=('i686' 'x86_64')
options+=('!debug')
url="https://git.enlightenment.org/enlightenment/python-efl"
license=('LGPL-3.0-only' 'GPL-3.0-only')
depends=("efl>=${pkgver%a*.*}" "$_python-dbus")
makedepends=('git' "${_python/p/c}")
provides=("${pkgname%-*}=$pkgver")
conflicts=("${pkgname%-*}")
source=("git+https://git.enlightenment.org/enlightenment/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$($_python setup.py -V | sed 's/-//' | tail -1)
  [[ "$v_ver" =~ ".99a" ]] || v_ver="${v_ver}.a$(git rev-list --count HEAD)"

  printf "%s.g%s" "$v_ver" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  $_python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"

  $_python setup.py install --root="$pkgdir" --optimize=1

# install text files
  install -d "$pkgdir/usr/share/doc/${pkgname%-*}/"
  install -m644 -t "$pkgdir/usr/share/doc/${pkgname%-*}/" AUTHORS README.md ChangeLog
}
