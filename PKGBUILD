# Maintainer: Piroro-hs

pkgname=psf-cozette
pkgver=1.24.1
pkgrel=2
pkgdesc='A bitmap programming font optimized for coziness, console version (PSF format)'
arch=('any')
url='https://github.com/slavfox/Cozette'
license=('MIT')
makedepends=('bdf2psf')
source=("${url}/releases/download/v.${pkgver}/cozette.bdf"
        "${url}/releases/download/v.${pkgver}/cozette_hidpi.bdf"
        "${url}/releases/download/v.${pkgver}/LICENSE"
        "codepoints.set")
sha384sums=('037bf10817f31bbf4cd3e038c10032289c23a6d179a5fd23c370d864d69d9e913093282e63b5681e03f517d0300aefd5'
            'b9e0c1ec731ce75aa580a16da50a7545d1e050bd4d3a4a2d4ccb755536e123e1c92c2ae2c3cdbe0be182296e1f59f4a3'
            'd7e16144c6cb7b6690b13732f94547445b12e13f2514773fdca0ebd4d3b238de5a816a15adb860929b77844554fe9850'
            'ecc6c97aabc0ac49bb1ed17a8467ac7e90c8eb595c72494727a7eff20b275a57875ae3f71da92b438d2d77ad686b2f90')

build() {
  # Confine Powerline left divider symbols to strictly 6 pixels wide
  awk -i inplace 'BEGIN { l=-128 } $1=="ENCODING"&&($2==57520||$2==57521||$2==57524) { l=FNR } l+4<FNR&&FNR<=l+17 { printf("%02X\n", and(lshift(strtonum("0x"$1), 1), 0xFF)); next; }{ print }' cozette.bdf
  awk -i inplace 'BEGIN { l=-128 } $1=="ENCODING"&&($2==57520||$2==57521||$2==57524) { l=FNR } l+4<FNR&&FNR<=l+30 { printf("%04X\n", and(lshift(strtonum("0x"$1), 1), 0xFFFF)); next; }{ print }' cozette_hidpi.bdf

  # Fix for bdf2psf limitation (See https://github.com/slavfox/Cozette/issues/122#issuecomment-2165328416)
  sed -i -e 's/^BBX [2-8]/BBX 9/g' cozette_hidpi.bdf

  bdf2psf --fb cozette.bdf /usr/share/bdf2psf/standard.equivalents codepoints.set 512 cozette6x13.psfu
  bdf2psf --fb cozette_hidpi.bdf /usr/share/bdf2psf/standard.equivalents codepoints.set 512 cozette12x26.psfu
  zstd -f cozette6x13.psfu
  zstd -f cozette12x26.psfu
}

package() {
  install -Dm644 cozette6x13.psfu.zst "${pkgdir}/usr/share/kbd/consolefonts/cozette6x13.psfu.zst"
  install -Dm644 cozette12x26.psfu.zst "${pkgdir}/usr/share/kbd/consolefonts/cozette12x26.psfu.zst"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
