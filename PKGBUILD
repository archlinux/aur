# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Mariusz Libera <mariusz.libera@gmail.com>
# Contributor: Nicolas Martyanoff <khaelin@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=ent
pkgver=1.2
debianver="${pkgver}debian-3"
pkgrel=1
pkgdesc="Pseudorandom number sequence test"
arch=('i686' 'x86_64')
url="http://packages.debian.org/sid/ent"
license=('custom')
depends=('glibc')
makedepends=('asciidoc' 'docbook2x' 'perl-xml-libxml')
source=("http://ftp.de.debian.org/debian/pool/main/e/${pkgname}/${pkgname}_${pkgver}debian.orig.tar.gz"
	"http://ftp.de.debian.org/debian/pool/main/e/${pkgname}/${pkgname}_${debianver}.debian.tar.xz"
	"LICENSE")
sha256sums=('2df63722b30d309f373416bfce69adaadb5f7a82294fb0d661c5f258dcc7d049'
            '4996f4b4f1980804a5cad167f0b25efc79d350b70d6abdc8888da99cb0fffd2d'
            '4ebee40438cb4df5dadbe3028002fdc17f07daee751cb79d53d7f55fbc37ce36')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}debian"

	# apply debian patches
	for patch in $(cat ../debian/patches/series) ; do
		patch -p1 < ../debian/patches/$patch
	done

	# fix for docbook2man binary name
	sed -i 's/docbook2x-man/db2x_docbook2man/g' Makefile
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
