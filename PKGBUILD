# Maintainer: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=sameboy-git
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
pkgver=1266.9e8b4345
pkgrel=1
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
provides=(sameboy)
depends=(sdl2)
# Upstream suggests using clang, but gcc is supported on Linux: https://github.com/LIJI32/SameBoy/issues/164#issuecomment-486464194
makedepends=(rgbds make git)
source=(git+https://github.com/LIJI32/SameBoy)
sha1sums=(SKIP)

prepare(){
	sed -i 's/-Werror//' SameBoy/Makefile
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
	cd SameBoy
	install -Dm755 build/bin/SDL/sameboy "$pkgdir/usr/bin/sameboy"
	find build/bin/SDL -type f -not -executable | while read f; do
		install -Dm644 "$f" "$pkgdir/usr/share/games/sameboy/${f#build/bin/SDL/}"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sameboy-git/LICENSE"
}
