# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=zecwallet-lite
pkgver=1.4.1
pkgrel=1
pkgdesc="Z-Addr first, Sapling compatible lightwallet client for Zcash"
arch=('any')
url="https://github.com/adityapk00/zecwallet-lite"
license=('MIT')
depends=('electron')
makedepends=('rust' 'nodejs' 'yarn' 'npm')
provides=('zcash-wallet')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adityapk00/zecwallet-lite/archive/v${pkgver}.tar.gz"
	"zecwallet-icons.tar.xz"
	"${pkgname}.desktop"
	"Cargo.lock") # Nasty Hack: Replace with versions tweaked so it builds.
	              # THIS SHOULD NOT BE PERMINANT
	              # https://github.com/zcash/librustzcash/issues/333
sha256sums=('2b3ed611a1075837c6d1aeb4f9d9288e15489ff2d65d35d382ba86043c87f878'
            '19d8b4acee2c6ff062e86ecbb2365123d0471f2991192323780b53630104574d'
            'a53083250c61d1e43cf3b5c371222bb5740e2befcdc4d9b7ea003a1f4ac30ef4'
            '5b53e2123cb4b32404b4bc7248b598f6d2953d50875f0e21ef2b424e7ee0096b')
            
prepare() {
  cd "${pkgname}-${pkgver}"
  #yarn lint-fix
  yarn install
}

build() {
  cd "$pkgname-$pkgver"
  cp ../Cargo.lock native/Cargo.lock
  yarn package-linux
}

package() {
  cd ${srcdir}
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/opt/${pkgname}/"
  cp -ra release/linux-unpacked/* "${pkgdir}/opt/${pkgname}/"
  cd ..
  
  # Icons
  cd ${srcdir}/zecwallet-icons
  resolutions="16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024"
  for res in ${resolutions};do
    install -Dm644 "${res}/apps/zecwallet-lite.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/zecwallet-lite.png"
  done
}
