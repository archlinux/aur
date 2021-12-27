# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=dahdi
_project="$pkgname-linux-complete"
pkgver=3.1.0
pkgrel=2
pkgdesc='DAHDI drivers for Asterisk'
arch=(x86_64)
url=http://www.asterisk.org
license=(GPL2)
depends=(libusb
         linux
         perl)
makedepends=(gcc10 linux-headers)
conflicts=(zaptel)
install="$pkgname.install"
_archive="$_project-$pkgver+$pkgver"
source=("https://downloads.asterisk.org/pub/telephony/$_project/releases/$_archive.tar.gz"{,.asc}
        "fix-linux-$pkgrel.patch::https://git.asterisk.org/gitweb/?p=dahdi/linux.git;a=patch;h=5c840cf43838e0690873e73409491c392333b3b8;hp=d07c4545ec48fac51ecd5309568504a59f4ada39"
        "$pkgname.service")
validpgpkeys=('CDBEE4CC699E200EB4D46BB79E76E3A42341CE04')
sha256sums=('30d8cfcbef9c3b6d7064df5dad7e9b752a9f635ee73c95d5e2931c5e46cc9f40'
            'SKIP'
            'ca4c5e2d4e01b2260a28c9018122bc81e7876e5d85bf7d1a2c6b758b0294b439'
            '7c91314aacab22ffd02794abfa7db49f44a796ea54f3e2bc4276616e68b90e0f')
prepare() {
	cd "$_archive/linux"
	# Unreleased 'next' branch has of fixes for Linux kernel 5.4, 5.6, 5.9
	patch -p1 < "$srcdir/fix-linux-$pkgrel.patch"
}

build() {
	cd "$_archive"
	export CC=gcc-10
	export CXX=g++-10
	make DESTDIR="$pkgdir" all
}

package() {
	cd "$_archive"
	make DYNFS=1 DESTDIR="$pkgdir" install
}
