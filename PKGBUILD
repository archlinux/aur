# Contributor: Joey Dumont <joey.dumont@gmail.com>
# Contributor: osc
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: larsrh <hupel@in.tum.de>

pkgname=pdftk-gcj
_pkgname=pdftk
pkgver=2.02
pkgrel=6
pkgdesc="Tool for doing everyday things with PDF documents"
arch=('x86_64')
url="http://www.pdfhacks.com/pdftk"
license=('GPL')
depends=('gcc6-libs' 'gcc6-gcj' 'gcc-gcj-ecj')
provides=('pdftk')
source=("http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/${_pkgname}-${pkgver}-src.zip"
	'Makefile.Arch' 'Makefile.patch'
	"pdftk.sh"
       )
sha256sums=('118f6a25fd3acaafb58824dce6f97cdc07e56050e666b90e4c4ef426ea37b8c1'
            '5baeb3e57905e31d56034993221c1e01e140f9185dc187b506c785fda5a1875e'
            '0784b19b82a3b816b533d33ca234a3643059bf5970226df1590945f8cf26bb8b'
            '6d36d4e2848c6b12d03fe76146de1de5379e5931ba907ee9bf5b2d0d32cef6c8')

prepare() {
	cd ${_pkgname}-$pkgver-dist/${_pkgname}
	cp "$srcdir"/Makefile.Arch .
	cd ..
	patch -Np1 < "$srcdir"/Makefile.patch
}

build() {
	cd ${_pkgname}-$pkgver-dist/${_pkgname}
	make -f Makefile.Arch
}

package() {
	cd ${_pkgname}-$pkgver-dist/${_pkgname}

	# Install binary
	install -D -m 755 pdftk "$pkgdir"/usr/bin/pdftk-bin
	
	# Install licenses and adjust permissions
	cd ..
	LICENSE_DIR="$pkgdir"/usr/share/licenses/$_pkgname
	mkdir -p "$LICENSE_DIR"
	cp -R license_gpl_pdftk/* "$LICENSE_DIR"
	chmod -R 0755 "$LICENSE_DIR"
	find "$LICENSE_DIR" -type f -exec chmod -x {} \;

	# Install manpage
	install -D -m 644 "pdftk.1" "$pkgdir"/usr/share/man/man1/pdftk-gcj.1

        # Install wrapper that sets the proper environment variables.
	install -D -m 755 "$srcdir"/pdftk.sh "$pkgdir"/usr/bin/pdftk.sh
}
