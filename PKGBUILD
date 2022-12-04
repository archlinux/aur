# Maintainer: Piroro-hs

pkgname=psf-envypn
pkgver=1.7.1
pkgrel=1
pkgdesc='Readable bitmap font inspired by Envy Code R, covers ISO 8859-1,2 and Powerline glyphs, console version (PSF format)'
arch=('any')
url='https://ywstd.fr/p/pj/#envypn'
license=('custom:MirOS License')
makedepends=('pcf2bdf' 'bdf2psf')
source=("https://ywstd.fr/files/p/envypn-font/envypn-font-${pkgver}.tar.gz"
        "charconv.sed"
				"codepoints.set")
sha384sums=('b53cc8166e7a0c039b4f4e579e258c842e6951d95f7d4cfd38a3868717ad8a27eecbf854ee34a926b2754ff12d5e2459'
            '94f24676e8489ea6d0c932c965a7be9f1bc633aa5ec74b793fdbb3ec9ff6eaa3105a7b9d4ad361e7ca6dfc0b6476263a'
            'b5f408337d094e1027d20da034375251d77aef3da675b7784c15c532ebe1e8ac5067db16eb605a5816fe8aef197b1c08')

build() {
	pcf2bdf -o envypn7x13.bdf envypn-font-${pkgver}/envypn7x13.pcf.gz
	pcf2bdf -o envypn7x13e.bdf envypn-font-${pkgver}/envypn7x13e.pcf.gz
	pcf2bdf -o envypn7x15.bdf envypn-font-${pkgver}/envypn7x15.pcf.gz
	pcf2bdf -o envypn7x15e.bdf envypn-font-${pkgver}/envypn7x15e.pcf.gz
	sed -i -f charconv.sed envypn7x13e.bdf
	sed -i -f charconv.sed envypn7x15e.bdf
	bdf2psf --fb envypn7x13.bdf+envypn7x13e.bdf /usr/share/bdf2psf/standard.equivalents codepoints.set 256 envypn7x13.psfu
	bdf2psf --fb envypn7x15.bdf+envypn7x15e.bdf /usr/share/bdf2psf/standard.equivalents codepoints.set 256 envypn7x15.psfu
	zstd envypn7x13.psfu
	zstd envypn7x15.psfu
}

package() {
	install -Dm644 "envypn7x13.psfu.zst" "${pkgdir}/usr/share/kbd/consolefonts/envypn7x13.psfu.zst"
	install -Dm644 "envypn7x15.psfu.zst" "${pkgdir}/usr/share/kbd/consolefonts/envypn7x15.psfu.zst"
	install -Dm644 "envypn-font-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
