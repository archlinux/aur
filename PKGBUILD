# Maintainer: Doug Newgard <scimmia at archlinux dot info>

_pkgname=rage
pkgname=$_pkgname-git
pkgver=0.1.4.r132.48d9936
pkgrel=2
pkgdesc="Video Player based on EFL - Development version"
arch=('i686' 'x86_64')
url="https://www.enlightenment.org/p.php?p=about/rage"
license=('BSD')
depends=('elementary')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git://git.enlightenment.org/apps/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  local v_ver=$(awk -F , '/^AC_INIT/ {gsub(/[\[\] -]/, ""); print $2}' configure.ac)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  make
}

package() {
  cd $_pkgname

  make -j1 DESTDIR="$pkgdir" install

# install text files
  install -Dm644 -t "$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README

# install license files
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
