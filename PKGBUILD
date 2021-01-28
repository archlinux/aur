# Maintainer: Francesco Minnocci <ascoli dot minnocci at gmail dot com>

_pkgname=urlview
pkgname=$_pkgname-xdg-git
pkgver=r20.ebaeb80
pkgrel=1
pkgdesc="A curses URL parser for text files. Git version, adds support for QUITONLAUNCH option and XDG Base Directory specification compliance."
arch=('i686' 'x86_64')
url="https://github.com/bachoseven/urlview"
license=('GPL')
conflicts=('urlview')
provides=('urlview')
depends=('bash')
makedepends=('git' 'automake' 'autoconf')
source=("git+https://github.com/bachoseven/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname
  aclocal
  automake --foreign --ignore-deps --add-missing
}

build() {
  cd $_pkgname

  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgname

  install -d "${pkgdir}"/etc/urlview "${pkgdir}"/usr/share/man/man1
  make prefix="${pkgdir}"/usr mandir="${pkgdir}"/usr/share/man install

  install -Dm755 url_handler.sh "${pkgdir}"/etc/urlview/url_handler.sh
  install -Dm644 sample.urlview "${pkgdir}"/etc/urlview/system.urlview
  install -d "${pkgdir}"/usr/bin
  ln -fs /etc/urlview/url_handler.sh "${pkgdir}"/usr/bin/url_handler.sh
}
# vim:set ts=2 sw=2 et:
