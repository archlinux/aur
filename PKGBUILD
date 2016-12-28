# Contributor: Ninez <triplesquarednine AT gmail DOT com>
# Contributor: N30N <archlinux@alunamation.com>
# Contributor: sekret (AUR)
# Maintainer: SanskritFritz (gmail)

pkgname=tupi-git
pkgver=0.2.git04.251.gdcd31b64
pkgrel=1
pkgdesc="A design and authoring tool for digital artists interested in 2D animation."
url="http://www.maefloresta.com/tupi"
license=("GPL3")
arch=("i686" "x86_64")
depends=("qt5-multimedia" "qt5-svg" "quazip" "ffmpeg" "shared-mime-info")
provides=("tupi")
conflicts=("tupi")
makedepends=("git" "ruby" "zlib" "libgl")
source=("git+https://github.com/xtingray/tupi.git" "quazip5.patch")
md5sums=('SKIP'
         'b5da9bd90ef57e6778f4e281572da3eb')

prepare() {
	cd tupi
	patch -p1 -i ../quazip5.patch
}

pkgver() {
	cd tupi
	git describe | sed -r 's/^v//;s/-/./g'
}

build() {
	cd tupi
	./configure \
		--libdir="/usr/lib" \
		--sharedir="/usr/share/tupi" \
		--without-debug
	make
}

package() {
	cd tupi
	make DESTDIR="$pkgdir" install

	sed "s|$pkgdir||" -i "$pkgdir/usr/bin/tupi"

	mkdir -p "$pkgdir/etc/ld.so.conf.d"
	echo "/usr/lib/tupi" > "$pkgdir/etc/ld.so.conf.d/tupi.conf"
}
