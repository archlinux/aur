# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=econnman-git
_pkgname=${pkgname%-*}
pkgver=1.1.0.r19.g5959946
pkgrel=1
pkgdesc="Enlightenment ConnMan user interface - Development version"
arch=('any')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('python-efl' 'connman')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/apps/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --localstatedir=/var

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS ChangeLog NEWS README

  chmod 666 "$pkgdir/var/lib/connman/econnman.config"
}
