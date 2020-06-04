# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Jakub Kądziołka <kuba@kadziolka.net>

pkgname=sameboy
pkgdesc="An accuracy-focused Game Boy/Game Boy Color emulator"
pkgver=0.13.1
pkgrel=1
arch=(x86_64)
url="https://github.com/LIJI32/SameBoy"
license=(MIT)
depends=(sdl2)
# Upstream suggests using clang, but gcc is supported on Linux: https://github.com/LIJI32/SameBoy/issues/164#issuecomment-486464194
makedepends=(rgbds make git)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LIJI32/SameBoy/archive/v${pkgver}.tar.gz")
md5sums=('c53b33add01083d977610411b238f337')

build(){
	cd "${srcdir}/SameBoy-${pkgver}"
	make sdl CONF=release DATA_DIR=/usr/share/games/sameboy/ CC=gcc
}

package(){
	cd "${srcdir}/SameBoy-${pkgver}"
	install -Dm755 build/bin/SDL/sameboy "$pkgdir/usr/bin/sameboy"
	find build/bin/SDL -type f -not -executable | while read f; do
		install -Dm644 "$f" "$pkgdir/usr/share/games/sameboy/${f#build/bin/SDL/}"
	done
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sameboy-git/LICENSE"
}
