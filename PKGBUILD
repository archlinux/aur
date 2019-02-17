# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=sameboy-git
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
pkgver=819.969fb5a
pkgrel=1
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
depends=(sdl2)
# Upstream requires clang, so using gcc might break
makedepends=(clang rgbds-git make git)
source=(git+ssh://git@github.com/LIJI32/SameBoy.git)
sha1sums=(SKIP)

pkgver(){
	cd SameBoy
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build(){
	cd SameBoy
	make sdl CONF=release DATA_DIR=/usr/share/games/sameboy/
}

package(){
	cd SameBoy
	install -Dm755 build/bin/SDL/sameboy "$pkgdir/usr/bin/sameboy"
	find build/bin/SDL -type f -not -executable | while read f; do
		install -Dm644 "$f" "$pkgdir/usr/share/games/sameboy/${f#build/bin/SDL/}"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sameboy-git/LICENSE"
}
