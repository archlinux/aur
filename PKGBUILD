# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Cravix < dr dot neemous at gmail dot org >

_pkgname=terminology
pkgname=$_pkgname-git
pkgver=1.3.99.r2086.3f1de6b
pkgrel=1
pkgdesc="EFL based terminal emulator - Development version"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('efl')
makedepends=('git' 'meson')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('debug')
source=("git+https://git.enlightenment.org/apps/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"

  local v_ver
  v_ver=$(awk -F"'" '/version:/{print $2; exit}' meson.build)

  printf "$v_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"

  export CFLAGS="$CFLAGS -fvisibility=hidden"

  ./autogen.sh \
    --prefix=/usr

  ninja -C build
}

package(){
  cd "$_pkgname"

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t"$pkgdir/usr/share/doc/$_pkgname/" ChangeLog NEWS README.md
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" AUTHORS COPYING
}
