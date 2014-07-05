# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=eweather
pkgname=$_pkgname-git
pkgver=0.2.0.r73.9efb4d5
pkgrel=1
pkgdesc="Enlightenment module: Current weather and forcast gadget"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL2.1')
depends=('libeweather-git' 'enlightenment>=0.18.99')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/enlightenment/modules/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install text files
  install -d "$pkgdir/usr/share/doc/$_pkgname/"
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" AUTHORS ChangeLog NEWS README
}

