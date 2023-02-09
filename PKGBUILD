# Maintainer: Piroro-hs

pkgname=psf-cozette
pkgver=1.19.0
pkgrel=1
pkgdesc='A bitmap programming font optimized for coziness, console version (PSF format)'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
makedepends=('bdf2psf')
source=("${url}/releases/download/v.${pkgver}/cozette.bdf"
        "${url}/releases/download/v.${pkgver}/LICENSE"
        "codepoints.set")
sha384sums=('33b80855df7b254b61596d60cf6a0098417f8530f1e9fa0207b661d9b3b164a1290047dff1e7f498a50759ca2e899fcc'
            'd7e16144c6cb7b6690b13732f94547445b12e13f2514773fdca0ebd4d3b238de5a816a15adb860929b77844554fe9850'
            '7ede9a68426b0fc61455e51e25329acf93574f56ee415a78e24d6bf4d7884ca827af638feddf139e94660360b9be9e8b')

build() {
  awk -Wposix '$1=="STARTCHAR" {u=$2} $1=="ENCODING" && $2=="-1" && u~/^u/  {printf("ENCODING %d\n", "0x" substr(u, 2)); next} {print}' cozette.bdf > cozette.bdf.tmp
  mv cozette.bdf.tmp cozette.bdf
  bdf2psf --fb cozette.bdf /usr/share/bdf2psf/standard.equivalents codepoints.set 512 cozette.psfu
  zstd cozette.psfu
}

package() {
  install -Dm644 "cozette.psfu.zst" "${pkgdir}/usr/share/kbd/consolefonts/cozette6x13.psfu.zst"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
