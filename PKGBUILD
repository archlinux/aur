# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=zecwallet-lite
pkgver=1.8.8
pkgrel=1
pkgdesc="Z-Addr first, Sapling compatible lightwallet client for Zcash"
arch=('any')
url="https://github.com/adityapk00/zecwallet-lite"
license=('MIT')
depends=('electron')
makedepends=('rust' 'nodejs-lts-fermium' 'yarn' 'npm' 'libxcrypt-compat')
provides=('zcash-wallet')
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/adityapk00/zecwallet-lite/archive/v${pkgver}.tar.gz"
	"zecwallet-icons.tar.xz"
	"${pkgname}.desktop"
	)
sha256sums=('84c8ff31c6df89410ac17b67b39eb471bd49886cefe38e2f3b1b8e84b01a5291'
            '19d8b4acee2c6ff062e86ecbb2365123d0471f2991192323780b53630104574d'
            '7d596dda26bfb44a4b910b128a7f2c3c7734d0722312c28147ade706b25027d2')

prepare() {
  cd "${pkgname}-${pkgver}"
  #yarn lint-fix
  yarn install
}

build() {
  cd "$pkgname-$pkgver"
  yarn dist:linux
}

package() {
  cd ${srcdir}
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/opt/${pkgname}/"
  cp -ra dist/linux-unpacked/* "${pkgdir}/opt/${pkgname}/"
  cd ..
  
  # Icons
  cd ${srcdir}/zecwallet-icons
  resolutions="16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024"
  for res in ${resolutions};do
    install -Dm644 "${res}/apps/zecwallet-lite.png" "${pkgdir}/usr/share/icons/hicolor/${res}/apps/zecwallet-lite.png"
  done
}
