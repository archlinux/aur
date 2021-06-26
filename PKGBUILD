# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael Manley <mmanley@nasutek.com>

pkgname=chan-sccp
pkgver=4.3.4
pkgrel=2
pkgdesc='Cisco SCCP channel driver for Asterisk, alternative to chan_skinny'
arch=(x86_64 i686)
url="https://chan-sccp.github.io/$pkgname"
license=(GPL)
depends=(libtool openssl zlib)
makedepends=(asterisk)
backup=('etc/asterisk/sccp.conf')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$pkgname/$pkgname/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('29b808e2329da46eba2a163615202d9fa89c4b6db00ec3b9589ec12ab76e7882')

build() {
	local _asterisk="$(asterisk -V | sed -e 's/.* \([0-9]\+\.[0-9]\+\).*/\1/')"
	cd "$pkgname-${pkgver/_/-}"
	./configure \
		--prefix=/usr \
		--with-asterisk-version="$_asterisk"
	make
}

# This exact syntax allows `makepkg --printsrcinfo` to just show 'asterisk' as
# a dependency, but the actual compiled packages to require 'asterisk=<version>'
# on the version it built against so that upgrades don't break unexpectedly
package(){
	local _asterisk="=$(pacman -Qn asterisk | awk -F'[ -]' '{ print $2 }')"
	depends=(asterisk$_asterisk ${depends[@]})
	cd "$pkgname-${pkgver/_/-}"
	make DESTDIR="$pkgdir" install
}

