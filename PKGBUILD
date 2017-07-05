# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: osc
# Contributor: StefanHusmann
# Contributor: larsrh <hupel@in.tum.de>

pkgname=pdftk
pkgver=2.02
pkgrel=16
pkgdesc="Pdftk is a simple tool for doing everyday things with PDF documents"
arch=('i686' 'x86_64')
url="http://www.pdfhacks.com/pdftk"
license=("GPL")
depends=('gcc63-gcj' 'gcc-gcj-ecj')
options=('!makeflags')
source=("http://www.pdflabs.com/tools/pdftk-the-pdf-toolkit/${pkgname}-${pkgver}-src.zip"
	"Makefile.Arch"
	"pdftk"
)
sha1sums=('a4a27e984c5e1401cfa44b8e92a64113d7396a06'
          '50da68be80a2ed9cf9ae2c24d0016ea19f0eec0d'
          '9ccacd5bf6a759563f2548a5ecb66fbe5132d1e7')

prepare() {
	cd "$srcdir/$pkgname-$pkgver-dist/$pkgname"
	cp "$srcdir/Makefile.Arch" .
}

build() {
	cd "$srcdir/$pkgname-$pkgver-dist/$pkgname"
	make -f Makefile.Arch
}

package() {
	cd "$srcdir/$pkgname-$pkgver-dist/$pkgname"

	# Install binary
	install -D -m 755 pdftk $pkgdir/usr/bin/pdftk-bin

	# Install licenses and adjust permissions
	cd ..
	LICENSE_DIR="$pkgdir/usr/share/licenses/$pkgname"
	mkdir -p "$LICENSE_DIR"
	cp -R license_gpl_pdftk/* "$LICENSE_DIR"
	chmod -R 0755 "$LICENSE_DIR"
	find "$LICENSE_DIR" -type f -exec chmod -x {} \;

	# Install manpage
	install -D -m 644 "pdftk.1" "$pkgdir/usr/share/man/man1/pdftk.1"

        # Install wrapper that sets the proper environment variables.
	install -D -m 755 "${srcdir}/pdftk" "${pkgdir}/usr/bin/pdftk" 
}
