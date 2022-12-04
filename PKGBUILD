# Maintainer: Piroro-hs

pkgname=psf-cozette
pkgver=1.18.1
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness, console version (PSF format)'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
makedepends=('bdf2psf')
source=("${url}/releases/download/v.${pkgver}/cozette.bdf"
        "${url}/releases/download/v.${pkgver}/LICENSE"
				"codepoints.set")
sha384sums=('790421efb1c0e4ba1f56ebb685498c2d9cbd0ce6635ca7591ea60ed9d690a6ef7a4883231469f71b4749c0940aab8807'
            'd7e16144c6cb7b6690b13732f94547445b12e13f2514773fdca0ebd4d3b238de5a816a15adb860929b77844554fe9850'
            '7ede9a68426b0fc61455e51e25329acf93574f56ee415a78e24d6bf4d7884ca827af638feddf139e94660360b9be9e8b')

build() {
  awk -Wposix '$1=="STARTCHAR" {u=$2} $1=="ENCODING" && $2=="-1" && u~/^u/  {printf("ENCODING %d\n", "0x" substr(u, 2)); next} {print}' cozette.bdf > cozette.bdf.tmp
  mv cozette.bdf.tmp cozette.bdf
  bdf2psf --fb cozette.bdf /usr/share/bdf2psf/standard.equivalents codepoints.set+:/usr/share/bdf2psf/useful.set 512 cozette.psfu
  zstd cozette.psfu
}

package() {
	install -Dm644 "cozette.psfu.zst" "${pkgdir}/usr/share/kbd/consolefonts/cozette6x13.psfu.zst"
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
