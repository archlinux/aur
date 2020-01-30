# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Pablo Lezaeta <(prflr 88) (arro'a) (gmail) (puntocom)>
pkgname=shim-efi-git
pkgver=15.r112.dada069
pkgrel=1
pkgdesc='UEFI shim loader'
arch=('x86_64')
url='https://github.com/rhboot/shim'
license=('BSD')
makedepends=('git' 'dos2unix' 'gnu-efi-libs-fedora-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+$url.git"
        'git+https://github.com/rhboot/edk2.git')
sha512sums=('SKIP'
            'SKIP')

pkgver() {
	cd shim
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd shim
	git submodule init
	git config submodule.edk2.url "$srcdir/edk2"
	git submodule update
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
