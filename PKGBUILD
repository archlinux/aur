# Maintainer: Jonas Witschel <diabonas@archlinux.org>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>
# Contributor: Pablo Lezaeta <(prflr 88) (arro'a) (gmail) (puntocom)>
pkgname=shim-efi-git
pkgver=15.r224.4033d1fd
pkgrel=1
pkgdesc='UEFI shim loader'
arch=('x86_64')
url='https://github.com/rhboot/shim'
license=('BSD')
makedepends=('git')
checkdepends=('xxd')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!buildflags')
source=("git+$url.git#branch=main"
        'rhboot-gnu-efi::git+https://github.com/rhboot/gnu-efi.git')
sha512sums=('SKIP'
            'SKIP')

pkgver() {
	cd shim
	git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

prepare() {
	cd shim
	git submodule init
	git config submodule.gnu-efi.url "$srcdir/rhboot-gnu-efi"
	git submodule update

	sed -e 's/-Werror //g' -i Makefile Make.defaults
}

build() {
	cd shim
	make
}

check() {
	cd shim
	make test
}

package() {
	cd shim
	make DESTDIR="$pkgdir" install-as-data
	install -Dm644 COPYRIGHT -t "$pkgdir/usr/share/licenses/$pkgname"
}
