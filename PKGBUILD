# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
_pkgname=compressure
pkgname=$_pkgname-git
pkgver=r416.74f702b
pkgrel=1
pkgdesc='Puzzle game about designing complex computation units powered by high pressure steam'
arch=(x86_64)
url='https://github.com/brejc8/ComPressure'
license=(CCPL:by)
depends=(sdl2_image sdl2_mixer sdl2_mixer sdl2_net sdl2_ttf)
makedepends=(git autoconf)
provides=($_pkgname)
conflicts=($_pkgname)
source=(
	$_pkgname::git+https://github.com/brejc8/ComPressure.git
	git+https://github.com/dacap/clip.git
	compressure.sh
	compressure.desktop
)
sha256sums=('SKIP'
            'SKIP'
            '6ddd2ec7ef2c9fcd761336000355fc0a067def83f832adcec6d4d57c3c01511c'
            '379fc8aa9624e30bd4b0fbf95308bc808f01594bf5b19a4a734b3c4791b754a1')

pkgver() {
	cd $_pkgname
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
  git submodule init
  git config submodule.clip.url ../clip
  git -c protocol.file.allow=always submodule update
}

build() {
	cd $_pkgname
	autoreconf -i
	./configure \
		--prefix=/usr \
		--disable-dependency-tracking \
		--disable-steam
	make ComPressure
}

package() {
	install -Dm755 $_pkgname.sh "$pkgdir"/usr/bin/$_pkgname
	install -Dm644 $_pkgname.desktop "$pkgdir"/usr/share/applications/$_pkgname.desktop
	cd $_pkgname
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname LICENSE.md README.md 
	install -Dm644 -t "$pkgdir"/usr/share/$_pkgname fixed.ttf lang.json \
		vent_steam.ogg move_steam.ogg music.ogg \
		font.png icon.png levels.png texture.png tutorial.png
	install -Dm755 ComPressure "$pkgdir"/usr/lib/$_pkgname
}
