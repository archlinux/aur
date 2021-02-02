# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>
# Maintainer: basxto <archlinux basxto de>

pkgname=sameboy-git
_genericname="Emulator"
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
_mimetype="application/x-gameboy-rom;application/x-gameboy-color-rom"
pkgver=1413.8ad08c1b
pkgrel=1
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
provides=(sameboy)
depends=(sdl2 hicolor-icon-theme)
# Upstream suggests using clang, but gcc is supported on Linux: https://github.com/LIJI32/SameBoy/issues/164#issuecomment-486464194
makedepends=(rgbds make git gendesk libicns imagemagick)
source=(git+https://github.com/LIJI32/SameBoy)
sha1sums=('SKIP')

prepare(){
	gendesk -f -n
	sed -i 's/-Werror//' SameBoy/Makefile
	icns2png -x "${srcdir}/SameBoy/Cocoa/AppIcon.icns" -o "${srcdir}"
}

pkgver(){
	cd SameBoy
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
	cd SameBoy
	make sdl CONF=release DATA_DIR=/usr/share/games/sameboy/
}

package(){
	# copy existing icon sizes
	for i in 16 32 256 512 1024;do
		install -d "${pkgdir}/usr/share//icons/hicolor/${i}x${i}/apps/"
		install -Dm644 "${srcdir}/AppIcon_${i}x${i}x32.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${provides[0]}.png"
	done
	# generate all other icon sizes
	for i in 24 48 64 72 96 128;do
		install -d "${pkgdir}/usr/share//icons/hicolor/${i}x${i}/apps/"
		magick convert "${srcdir}/AppIcon_256x256x32.png" -resize ${i}x${i} "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${provides[0]}.png"
	done
	install -Dm644 "${provides[0]}.desktop" "${pkgdir}/usr/share/applications/${provides[0]}.desktop"
	cd SameBoy
	install -Dm755 build/bin/SDL/sameboy "$pkgdir/usr/bin/sameboy"
	find build/bin/SDL -type f -not -executable | while read f; do
		install -Dm644 "$f" "$pkgdir/usr/share/games/sameboy/${f#build/bin/SDL/}"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sameboy-git/LICENSE"
}
