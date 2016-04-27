# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: Ronald van Haren <ronald.archlinux.org>

_pkgname=ephoto
pkgname=$_pkgname-git
pkgver=0.9.99.713.2d61927
pkgrel=2
pkgdesc="A light image viewer based on EFL"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/apps/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local efl_version=$(grep -m1 EFL_VERSION configure.ac | awk -F [][] '{print $2 "." $4 "." $6}')
  efl_version=$(awk -F , -v efl_version=${efl_version%.} '/^AC_INIT/ {gsub(/efl_version/, efl_version); gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$efl_version.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  ./autogen.sh \
    --prefix=/usr \
    --disable-static

  make
}

package() {
  cd $_pkgname

  make DESTDIR="$pkgdir" install

# install text files
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README

# install license files
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
