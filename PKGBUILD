# Maintainer: Aren Moynihan <aren@peacevolution.org>
# Based on mms-tng-git by Caleb Fontenot <foley2431 at gmail dot com>

pkgname=vvmd-git
pkgver=0.6.1.r0.gc319b09
pkgrel=1
pkgdesc="Visual Voicemail Daemon"
url="https://gitlab.com/kop316/vvmd"
arch=('x86_64' 'aarch64')
license=("GPL2")
depends=("mobile-broadband-provider-info" "libmm-glib" "libphonenumber")
makedepends=("git" "meson")
provides=("vvmd")
conflicts=("vvmd")
source=("$pkgname::git+https://gitlab.com/kop316/vvmd"
        "vvmd.service")
sha256sums=("SKIP"
            "b4bfd3b3758427975eee8ca5b4a39fb43ce7ea36b56d7c82a23fdacdb4161c50")

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'  
}

build() {
  cd "$srcdir/$pkgname"

  arch-meson "$srcdir/$pkgname" build
  meson compile -C build
}

check() {
  cd "$srcdir/$pkgname"

  meson test -C build
}

package() {
  cd "$srcdir/$pkgname"

  meson install -C build --destdir "$pkgdir"

  mkdir -p "$pkgdir/usr/lib/systemd/user/default.target.wants"
  install -Dm644 "../vvmd.service" "$pkgdir/usr/lib/systemd/user"
  ln -sfv "/usr/lib/systemd/user/vvmd.service" \
    "$pkgdir/usr/lib/systemd/user/default.target.wants/vvmd.service"
}
