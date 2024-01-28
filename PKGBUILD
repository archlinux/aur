# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay
pkgver=0.0.95
pkgrel=1
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='https://github.com/mmitch/gbsplay'
license=('GPL-1.0-or-later')
depends=('alsa-lib' 'libpulse' 'nas' 'sdl2' 'zlib')
source=("https://github.com/mmitch/gbsplay/archive/refs/tags/$pkgver.tar.gz"
        'do-not-update-database.patch')
sha512sums=('d8025bbfe60a7a76386f4510167106441358ce1b1ced632e839d8d3006e2bbb0ba520162ad0eda4d6d7f9b71b486e6939760ba267582944d4f2c0c166bb75c36'
            '2de20d227fe5cb17fd29b666fb55438560b6859a2bcccad910a631189a3698f220b29791493b5ab105fcabd92419b04edd220b85a4b5034723a63fe2f4b898ff')

prepare() {
	cd gbsplay-$pkgver
	sed 's|gbs2ogg.sh|$0|g' --in-place contrib/gbs2ogg.sh
	patch -p1 < "$srcdir"/do-not-update-database.patch
}

build() {
	cd gbsplay-$pkgver
	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd gbsplay-$pkgver

	make DESTDIR="$pkgdir" install

	install -Dm644 LICENCE "$pkgdir"/usr/share/licenses/gbsplay/LICENCE

	cd contrib
	install -Dm755 gbs2ogg.sh "$pkgdir"/usr/bin/gbs2ogg
	install -Dm644 gbsplay.bashcompletion "$pkgdir"/etc/bash_completion.d/gbsplay
}
