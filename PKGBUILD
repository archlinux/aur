# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=gbsplay
pkgver=0.0.91
pkgrel=9
pkgdesc="A command line application for playing GameBoy sound files (GBS)"
arch=('i686' 'x86_64')
url='http://www.cgarbs.de/gbsplay.en.html'
license=('GPL')
depends=('alsa-lib' 'nas')
source=('rand_long.patch'
        "http://www.cgarbs.de/stuff/$pkgname-$pkgver.tar.gz")
sha512sums=('a6d06630c85d5ad7f059bba142ced830302f7a159f7ed856b9b49b3dcf5808ac523da4047a9f6a68ced33528d8be804c6403be19c135fbe245f6d3087b267bc2'
            '94a5acd892740f2443fbc5455a190cba2aefddf3608a6f59213175bb8985d21d4f2cb4011e332756ae2bf977432e03be53014f203d7b9edc572048e2a6124f08')

prepare() {
	cd "$pkgname-$pkgver"

	patch -p1 < ../rand_long.patch # https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=777862
}

build() {
	cd "$pkgname-$pkgver"

	./configure --prefix=/usr --mandir=/usr/share/man

	sed 's|gbs2ogg.sh|$0|g' --in-place contrib/gbs2ogg.sh

	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install

	cd contrib
	install gbs2ogg.sh "$pkgdir"/usr/bin/gbs2ogg
	install --directory "$pkgdir"/etc/bash_completion.d
	cp gbsplay.bashcompletion "$pkgdir"/etc/bash_completion.d/gbsplay
}
