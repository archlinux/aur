# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay
pkgver=0.0.93.99
pkgrel=1
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='https://github.com/mmitch/gbsplay'
license=('GPL')
depends=('libpulse' 'nas')
makedepends=('git')
source=('git+https://github.com/mmitch/gbsplay.git#commit=ac57c84d4a3eee27c9ede5af7d9d269f91645e99'
        'do-not-update-database.patch')
sha512sums=('SKIP'
            '2de20d227fe5cb17fd29b666fb55438560b6859a2bcccad910a631189a3698f220b29791493b5ab105fcabd92419b04edd220b85a4b5034723a63fe2f4b898ff')

prepare() {
	cd gbsplay
	sed 's|gbs2ogg.sh|$0|g' --in-place contrib/gbs2ogg.sh
	git apply -3 "$srcdir"/do-not-update-database.patch
}

build() {
	cd gbsplay

	./configure --prefix=/usr --mandir=/usr/share/man
	make
}

package() {
	cd gbsplay

	make DESTDIR="$pkgdir" install

	cd contrib
	install gbs2ogg.sh "$pkgdir"/usr/bin/gbs2ogg
	install -Dm644 gbsplay.bashcompletion "$pkgdir"/etc/bash_completion.d/gbsplay
}
