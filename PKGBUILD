# Maintainer: EndlessEden <eden (at) rose.place>
# Original Maintainer: Ivy Foster <ivy.foster@gmail.com>

pkgname='sndio-git'
pkgver=1.8.1.r558.a02d299
pkgrel=1
pkgdesc='A small audio and MIDI framework part of the OpenBSD project'
arch=('i686' 'x86_64')
url='http://www.sndio.org'
license=('MIT')
depends=(alsa-lib libbsd)
replaces=('sndio')
conflicts=('sndio' "$pkgname")
provides=("$pkgname" "sndio=$pkgver" "libsndio.so=$pkgver")
source=("$pkgname"::'git+https://caoua.org/git/sndio')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir"/"$pkgname"
	git describe | sed "s,release_1_0_1,$(git tag | tail -1 | sed 's,release_,,; s,_,.,g'),; s,_,.,g; s,-\(.*\)-.,.r\1.,"
}

build() {
	cd "$srcdir"/"$pkgname"
	./configure --prefix=/usr --enable-alsa --with-libbsd
	make
}

package() {
	cd "$srcdir"/"$pkgname"

	make DESTDIR="$pkgdir/" install

	install -D -m 644 contrib/sndiod.service \
		"$pkgdir/usr/lib/systemd/system/sndiod.service"
	install -D -m 644 contrib/default.sndiod \
		"$pkgdir/etc/default/sndiod"
}
