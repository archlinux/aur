# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Pablo Lezaeta <(prflr 88) (arro'a) (gmail) (puntocom)>
pkgname=shim-efi-git
pkgver=15.r54.6245dc5
pkgrel=1
pkgdesc='UEFI shim loader'
arch=('x86_64')
url='https://github.com/rhboot/shim'
license=('BSD')
makedepends=('git' 'gnu-efi-libs')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git")
sha512sums=('SKIP')

prepare() {
	cd shim
	# Fix build failure due to missing closing brace
	git pull origin pull/166/merge
}

pkgver() {
	cd shim
	printf '%s' "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd shim
	make EFI_PATH=/usr/lib ENABLE_HTTPBOOT=1
}

package() {
	cd shim
	make DESTDIR="$pkgdir" install-as-data
	install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname"
}
