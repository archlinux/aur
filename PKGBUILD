# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: fancris3 <fancris3 at aol.com>

_pkgname=places
pkgname=$_pkgname-git
pkgver=0.20.r212.90b79a4
pkgrel=1
pkgdesc='Enlightenment module: Manage the mounting of volumes'
arch=('i686' 'x86_64')
url='https://phab.enlightenment.org/w/emodules/places/'
license=('MIT')
depends=('enlightenment>=0.19.99' 'udisks')
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
  install -m644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
