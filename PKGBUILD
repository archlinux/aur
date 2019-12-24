# Maintainer: Thom Wiggers <pkgbuild@thomwiggers.nl>
# Contributor: Sirat18 <aur@sirat8.de>
# Contributor: wodim <neikokz@gmail.com>

pkgname=networkmanager-iodine-git
pkgver=r145.2ef0abf
pkgrel=1
pkgdesc="Iodine plugin for NetworkManager"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/network-manager-iodine"
license=('GPL')
depends=('iodine' 'networkmanager' 'gtk3' 'libnma' 'libnm-glib')
makedepends=('git' 'intltool')
source=(
  "$pkgname"::'git+https://gitlab.gnome.org/GNOME/network-manager-iodine.git'
  glib-2.58-fix-commit-2ef0abf089b00a0546f214dde0d45e63f2990b79.patch
)
sha512sums=(
  'SKIP'
  '9fce5486dad7ceb543df27660d3e51cc02a7f3209a5918e66cf2c584674f27e1f13cfc224502595c94e31113bdca10fa3c976dd857c21dee788c2dd6c6471b2a'
)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/$pkgname"
  export CFLAGS="-O2 -Wno-error=deprecated-declarations"
  patch -p1 <../glib-2.58-fix-commit-2ef0abf089b00a0546f214dde0d45e63f2990b79.patch
  ./autogen.sh --prefix=/usr --sysconfdir=/etc || return 1
  make || return 1
}

package() {
  cd "${srcdir}/$pkgname"
  make DESTDIR="$pkgdir" install || return 1
}
