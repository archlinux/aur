# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=electorrent
pkgver=2.7.1
pkgrel=2
pkgdesc="A remote control client for µTorrent, qBittorrent, rTorrent, Transmission, Synology & Deluge"
arch=('x86_64')
url='https://github.com/Tympanix/Electorrent'
license=('GPL3')
depends=('gtk3'
         'nss'
         'libxss')
makedepends=('gendesk' 'npm' 'libicns' 'graphicsmagick' 'gulp')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/tympanix/Electorrent/archive/v${pkgver}.tar.gz")
sha256sums=('2c9479332264eafa71c0372088462e27bd23f5bbd0e55be6eccb1d69e2757c41')

build() {
  cd "Electorrent-${pkgver}"
  rm -rf "${srcdir}/npm-cache"
  mkdir ${srcdir}/npm-cache
  npm install --cache "${srcdir}/npm-cache"
  npm run dist
}

package() {
  cd "Electorrent-${pkgver}"
  install -Dm644 build/png/512x512.png "${pkgdir}/usr/share/pixmaps/electorrent.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Electorrent" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Network;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/opt"
  cp -avR dist/linux-unpacked "${pkgdir}/opt/${pkgname}"
  ln -s /opt/${pkgname}/electorrent "${pkgdir}/usr/bin/electorrent"
  for i in 16 32 64 128 256 512; do
    install -Dm644 build/png/${i}x${i}.png \
    "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/electorrent.png"
  done
  # find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} +
}
