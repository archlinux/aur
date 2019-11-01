# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: osc
# Contributor: StefanHusmann
# Contributor: larsrh <hupel@in.tum.de>

pkgname=pdftk-gcj
_pkgname=pdftk
pkgver=2.02
pkgrel=2
pkgdesc="Tool for doing everyday things with PDF documents"
arch=('i686' 'x86_64')
url="http://www.pdfhacks.com/pdftk"
license=('GPL')
depends=('gcc6-gcj' 'gcc-gcj-ecj')
provides=('pdftk')
options=('!makeflags')
source=("http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/${_pkgname}-${pkgver}-src.zip"
	"Makefile.Arch"
	"pdftk"
)
sha1sums=('a4a27e984c5e1401cfa44b8e92a64113d7396a06'
          '0c8e1a442d266eb6782349e41652c6c07464222e'
          '1cc399569ff9cca3f514d9385dd3884733cca150')

prepare() {
	cd ${_pkgname}-$pkgver-dist/${_pkgname}
	cp "$srcdir"/Makefile.Arch .
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
	sed -i "s/CARCH/${CARCH}/" "$srcdir"/pdftk
	sed -i "s/GCCVER/`gcc-6 -dumpversion`/" "$srcdir"/pdftk
	install -D -m 755 "$srcdir"/pdftk "$pkgdir"/usr/bin/pdftk.sh
}
