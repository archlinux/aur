# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael Manley <mmanley@nasutek.com>

pkgname=chan-sccp
pkgver=4.3.5
pkgrel=1
pkgdesc='Cisco SCCP channel driver for Asterisk, alternative to chan_skinny'
arch=(x86_64 i686)
url="https://chan-sccp.github.io/$pkgname"
license=(GPL)
depends=(libtool
         openssl
         zlib)
makedepends=(asterisk)
backup=('etc/asterisk/sccp.conf')
_archive="$pkgname-${pkgver/_/-}"
source=("$_archive.tgz::https://github.com/$pkgname/$pkgname/archive/v${pkgver/_/-}.tar.gz")
sha256sums=('ee7ce93f282cc99875566016520085a22feabc97649188571dfda00c789985fe')

build() {
	local _asterisk="$(asterisk -V | sed -e 's/.* \([0-9]\+\.[0-9]\+\).*/\1/')"
	cd "$_archive"
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
	depends=(asterisk$_asterisk "${depends[@]}")
	cd "$_archive"
	make DESTDIR="$pkgdir" install
}

