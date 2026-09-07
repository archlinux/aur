# Maintainer: Hakii <hakii@necron.dev>
# Contributor: mishakmak <https://gitlab.com/mishakmak/pam-fprint-grosshack>
pkgname=pam-fprint-grosshack-fork-git
pkgver=r1.3c67a68
pkgrel=1
pkgdesc="Simultaneous fingerprint (fprintd) and password PAM authentication, rebased on fprintd HEAD"
arch=('x86_64')
url="https://github.com/LuvHakii/pam-fprint-grosshack"
license=('GPL-2.0-or-later')
depends=('fprintd' 'pam' 'systemd-libs')
makedepends=('git' 'meson')
provides=('pam-fprint-grosshack')
conflicts=('pam-fprint-grosshack' 'pam-fprint-grosshack-unlimited-timeout')
source=("$pkgname::git+https://github.com/LuvHakii/pam-fprint-grosshack.git#branch=grosshack-1.94.x")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  meson setup "$srcdir/$pkgname" build \
    --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build --no-rebuild
  install -Dm644 "$srcdir/$pkgname/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
