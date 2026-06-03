# Maintainer: Ash <xash at riseup d0t net>
pkgname=evolution-on-git
pkgver=3.60.2.r0.gf461f32
pkgrel=1
pkgdesc="Tray plugin for the Evolution email client (patched for evolution 3.60.x)"
arch=('x86_64')
url="https://github.com/awsms/evolution-on"
license=('GPL2')
depends=('evolution' 'libnotify' 'libappindicator')
makedepends=('git' 'gnome-common' 'intltool')
provides=('evolution-on')
conflicts=('evolution-on')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd evolution-on
  git describe --tags --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd evolution-on
  ./autogen.sh --prefix=/usr --libdir=/usr/lib --with-libappindicator=yes
  make
}

package() {
  cd evolution-on
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/lib/evolution/plugins/liborg-gnome-evolution-on.la"
}
