# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>
# Maintainer: basxto <archlinux basxto de>
# Maintainer: ISSOtm <arch@eldred.fr>

pkgname=sameboy-git
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
pkgver=0.16.6.r54.d34579e
pkgrel=1
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
provides=(sameboy)
conflicts=(sameboy)
depends=(sdl2 hicolor-icon-theme)
# Upstream suggests using clang, but gcc is supported on Linux: https://github.com/LIJI32/SameBoy/issues/164#issuecomment-486464194
makedepends=(rgbds make git)
source=(git+https://github.com/LIJI32/SameBoy)
sha1sums=('SKIP')

pkgver() {
	cd SameBoy
	git describe --long | sed 's/\([^-]*-\)g/r\1/; s/-/./g; s/v//'
}

build() {
	make -C SameBoy sdl xdg-thumbnailer CONF=release PREFIX=/usr
}

package() {
	make -C SameBoy install CONF=release PREFIX=/usr DESTDIR="$pkgdir"
	# Installing MIME type icons is nice in principle, but would conflict with other packages
	# attempting the same. That's a shame!
	rm -rv "$pkgdir"/usr/share/icons/hicolor/*/mimetypes
	# Move license to the correct path for arch.
	install -d "$pkgdir/usr/share/licenses/$pkgname/"
	mv "$pkgdir/usr/share/sameboy/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/"
}
