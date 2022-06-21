# Maintainer: GI Jack <GI_Jack@hackermail.com>

pkgname=zecwallet-lite
pkgver=1.7.13
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
	)
sha256sums=('aaac43490555b0aad4497db9c55c200f517872107f9bc4330634b1238cb97a9f'
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
