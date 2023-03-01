# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=yadifa
pkgver=2.6.4
_buildnr=10892
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
sha256sums=('d8bb73a2d645594acbf05169542947bbf447911fbe63392e010dae00d803b571'
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

