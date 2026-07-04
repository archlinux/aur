# Maintainer: Engdyn <aur cat engdyn dog de>
# Contributor: Brenden Hoffman <hbrenden@fastmail.com>
# Contributor: Andy Delgado <cuba200611@gmail.com>
pkgname=libretro-np2kai-git
pkgver=r1091.54ec39f
pkgrel=1
pkgdesc="NEC - PC-98 (Neko Project II Kai) core"
arch=(x86_64 aarch64 i686)
url="http://domisan.sakura.ne.jp/article/np2kai/np2kai.html"
license=(MIT)
groups=(libretro)
depends=(
	gcc-libs
	libretro-core-info
)
makedepends=(
	git
	make
)
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
options=(!lto)
source=(${pkgname%-git}::git+https://github.com/libretro/NP2kai.git)
sha256sums=(SKIP)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/sdl"
	CFLAGS+=" -Wno-incompatible-pointer-types"
	make -f Makefile.libretro
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 sdl/np2kai_libretro.so -t "$pkgdir/usr/lib/libretro"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
