# Maintainer: Caleb Fontenot <foley2431 at gmail dot com>
# Co-Maintainer: Lance G. <gero3977 at gmail dot com>
pkgname=mmsd-tng-git
pkgver=1.10.r0.gac0dbc3
pkgrel=1
pkgdesc="Multimedia Messaging Service Daemon - The Next Generation"
url="https://git.kernel.org/pub/scm/network/ofono/mmsd.git"
arch=('x86_64' 'armv7h' 'aarch64')
license=("GPL2")
provides=("mmsd" "mmsd-tng")
conflicts=("mmsd" "mmsd-tng")
depends=("c-ares" "mobile-broadband-provider-info" "libmm-glib" "libsoup" "libphonenumber")
makedepends=("git" "meson")
source=("$pkgname::git+https://gitlab.com/kop316/mmsd.git"
        "https://salsa.debian.org/DebianOnMobile-team/mmsd-tng/-/raw/debian/latest/debian/mmsd-tng.user.service")
sha256sums=("SKIP"
            "SKIP")

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'  
}

prepare() {
	cd "$srcdir/$pkgname"
	meson _build
}

build() {
	cd "$srcdir/$pkgname"
	arch-meson $srcdir/$pkgname build
	meson compile -C _build
}
check() {
	cd "$srcdir/$pkgname"
	meson test -C _build
}

package() {
	cd "$srcdir/$pkgname"
	DESTDIR="$pkgdir" meson install -C build
        install -Dm644 "$srcdir/mmsd-tng.user.service" "$pkgdir/usr/lib/systemd/user/mmsd-tng.service"
}
