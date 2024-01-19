# Maintainer: Caleb Fontenot <foley2431 at gmail dot com>
# Co-Maintainer: Lance G. <gero3977 at gmail dot com>
pkgname=mmsd-tng-git
pkgver=2.5.0.r0.g6529119
pkgrel=1
pkgdesc="Multimedia Messaging Service Daemon - The Next Generation"
url="https://gitlab.com/kop316/mmsd"
arch=('x86_64' 'armv7h' 'aarch64')
license=("GPL2")
provides=("mmsd" "mmsd-tng")
conflicts=("mmsd" "mmsd-tng")
depends=("c-ares" "mobile-broadband-provider-info" "libmm-glib" "libsoup3" "libphonenumber"
         "glib2" "glibc" "gcc-libs")
makedepends=("git" "meson")
source=("$pkgname::git+https://gitlab.com/kop316/mmsd.git"
        "mmsd-tng.service")
sha256sums=("SKIP"
            "493f7ec8193b3a7ce2fc49dff497a03e683d0feb547b9814ae76b032a1145417")

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
        install -Dm644 "$srcdir/mmsd-tng.service" "$pkgdir/usr/lib/systemd/user/mmsd-tng.service"
}
