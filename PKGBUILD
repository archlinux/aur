# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=ent
pkgver=1.1
debianver="${pkgver}debian-4"
pkgrel=3
pkgdesc="Pseudorandom number sequence test"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/ent"
license=('custom')
depends=('glibc')
makedepends=('asciidoc' 'docbook2x' 'perl-xml-libxml')
source=("http://ftp.de.debian.org/debian/pool/main/e/${pkgname}/${pkgname}_${pkgver}debian.orig.tar.gz"
	"http://ftp.de.debian.org/debian/pool/main/e/${pkgname}/${pkgname}_${debianver}.debian.tar.xz"
	"LICENSE")
sha256sums=('8ac6606208ed8ed094479f6e12fe28a65bab0fd5c8eb054b74c65c86f98427a0'
            'ebb2a26231424465b5480e7bb0db24407f2ad6031db471dab07b9e8b145b0ad3'
            '4ebee40438cb4df5dadbe3028002fdc17f07daee751cb79d53d7f55fbc37ce36')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}debian"

	# apply debian patches
	for patch in $(cat ../debian/patches/series) ; do
		patch -p1 < ../debian/patches/$patch
	done

	# fix for docbook2man binary name
	sed -i 's/docbook2x-man/docbook2man/g' Makefile
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}debian"
	make
}

check() {
	cd "${srcdir}/${pkgname}-${pkgver}debian"
	make test
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}debian"

	# binary
	install -Dm 755 "$pkgname" "$pkgdir/usr/bin/$pkgname"

	# license
	install -Dm 644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	# man page
	install -Dm 644 ent.1 "$pkgdir/usr/share/man/man1/ent.1"
}
