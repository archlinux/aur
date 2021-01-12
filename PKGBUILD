# Maintainer: Rudy Matela <rudy@matela.com.br>
# Contributor: Rudy Matela <rudy@matela.com.br>
# Contributor: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: _le34n$ <4le34n@gmail.com>
# Contributor: Starfry <archlinux@jelmail.com>

pkgname=nfdump
pkgver=1.6.22
pkgrel=1
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
sha1sums=('c4e348e64fc3ca56d8348e9a28c75b1c4154ce24'
          '3ab48b59df90c287eb1546128f5462bd1b187cdd'
          'ba9789ad6bf2b642b8c888a33379f74094c11566'
          'c8e91e0bdee76eae6627d6d0f9c7a2360c488c5d')
sha256sums=('437536acb02258f8e2cd1e63c801428c65e1c33100e349acbf718c5b04734bd0'
            '75ea928dec07b9d66d53b8025d378bff0df2e8605b0bcda40bd95e4b8313f064'
            'b2eb41738268b4aedfc680eb4cac241e46eea89f4cab284e8f51c425ec019b06'
            '383c5a38cbba40818697fc1e09baac9f44262ff693a1089cadb1e797ace1878f')

prepare() {
	cd "$pkgname-$pkgver"

	sed -re 's|-lnfdump|libnfdump.la|g' -i bin/Makefile.am
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
