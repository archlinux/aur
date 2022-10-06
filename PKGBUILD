# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=yadifa
pkgver=2.6.0
_buildnr=10786
pkgrel=1
pkgdesc="lightweight authoritative Name Server with DNSSEC capabilities"
arch=('x86_64')
url="http://www.yadifa.eu"
license=('BSD')
depends=('openssl')
backup=('etc/yadifad.conf')
options=(!libtool)
source=(
    "https://www.yadifa.eu/sites/default/files/releases/$pkgname-$pkgver-$_buildnr.tar.gz"
    "https://www.yadifa.eu/sites/default/files/$pkgname-$pkgver-$_buildnr.tar.gz.asc"
	'yadifa.service'
)
sha256sums=('7439a7214345a9a419be0ce93e2df0411e17d368623493bb7ee89725437f2b76'
            'SKIP'
            'f8a232461a4db320b40eed3573cfc71922c31b33dc5f5dd438a2b18f59e3daf7')

validpgpkeys=(
    '9DF4F4485F6FC40513572886A75042DBD6669651'  # "yadifa"
)

build() {
	cd $pkgname-$pkgver-$_buildnr
    ./configure \
        --prefix=/usr \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --with-tools \
        --enable-rrl \
        --enable-nsid \
        --enable-ctrl \
        --enable-systemd-resolved-avoidance
	make
}

package(){
	cd $pkgname-$pkgver-$_buildnr
	make DESTDIR="$pkgdir" install

	# systemd service file
	install -Dm644 "$srcdir/yadifa.service" \
        "$pkgdir/usr/lib/systemd/system/yadifa.service"

	# little cleanup
	rm -rf "$pkgdir/var/run"
	rm -rf "$pkgdir/var/log"
}

