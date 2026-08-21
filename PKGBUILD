# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: _le34n$ <4le34n@gmail.com>
# Contributor: Starfry <archlinux@jelmail.com>

pkgname=nfdump
pkgver=1.7.8
pkgrel=2
pkgdesc="A set of tools to collect and process netflow data."
arch=('x86_64' 'i686')
url="https://github.com/phaag/nfdump/"
license=('BSD')
depends=('rrdtool')
makedepends=()
source=("nfdump-v${pkgver}.tar.gz::https://github.com/phaag/nfdump/archive/v${pkgver}.tar.gz"
        'sysusers'
        'tmpfiles'
        'service')
sha1sums=('6a41163247f1c4b97735f1fc86b06a0c8b67079a'
          '3ab48b59df90c287eb1546128f5462bd1b187cdd'
          'bb33a35fa5dcfc14217aa13d77e67e84652e4f04'
          '9dbccc963a73c3f17c7c8145544e45ee9d529ab6')
sha256sums=('d9b881f7e3ecde281c1116e8330ae612d0e5adcd0e952f401b2045c6446a1232'
            '75ea928dec07b9d66d53b8025d378bff0df2e8605b0bcda40bd95e4b8313f064'
            'd1174d15a40745c661162af1fabb25a5008b4f2cab257ab1c3f913c25a941660'
            '8c007f50450458ba4aace1b96c1c7a87644b13c9d6a3ef179b0e00f6c14d8254')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"

	./autogen.sh  # needed since 1.6.17
	./configure --prefix=/usr \
	  --enable-nfprofile \
	  --enable-nftrack \
	  --enable-sflow

	make
}

package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir" install
	install -Dm644 COPYING \
		"$pkgdir/usr/share/licenses/nfdump/COPYING"
	install -Dm644 ../sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
	install -Dm644 ../tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
	install -Dm644 ../service "$pkgdir/usr/lib/systemd/system/nfcapd@.service"
}
