# Maintainer: h3li0p4us3 Moharami <h3li0p4us3 at proton dot me>

pkgname=dnschanger-desktop
pkgver=2.2.0
pkgrel=1
_electronversion=23
pkgdesc="DNS Changer for Windows, Mac and Linux operating systems"
arch=('x86_64')
url="https://dnschanger.github.io"
license=('MIT')
depends=("electron${_electronversion}" 'polkit')
makedepends=('libxcrypt-compat' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DnsChanger/dnsChanger-desktop/archive/refs/tags/v${pkgver}.tar.gz"
        'target.patch'
        'dnschanger.sh'
        'dnschanger.desktop')
sha256sums=('fef6413eabadce6cd6a18f67bd958f0d9e1bb64e05df72cdcb991836bc28e026'
            '7f2c3505459ad37f493426d6be90b9befe017efacb18dafc332654eaf2a3d440'
            '7502440862c3320ee8e3c3a6ce741adaf852cef337f366c55f67a0fe237a4500'
            'eae9227511b3714910b9dffb7986a0dbdfebe33f70898c96055bb40314e6c206')

prepare() {
  cd "dnsChanger-desktop-${pkgver}"
  export npm_config_cache="${srcdir}/npm_cache"
  npm install

  # Don't package AppImage or rpm
  patch -Np1 -i ../target.patch
}

build() {
  cd "dnsChanger-desktop-${pkgver}"
  electronDist="/usr/lib/electron${_electronversion}"
  electronVer="$(sed s/^v// /usr/lib/electron${_electronversion}/version)"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export npm_config_cache="${srcdir}/npm_cache"
  npm exec tsc
  npm exec vite build
  npm exec electron-builder --linux --dir \
    $dist -c.electronDist=$electronDist -c.electronVersion=$electronVer
}

package() {
  cd "dnsChanger-desktop-${pkgver}"
  install -Dm644 "release/${pkgver}/linux-unpacked/resources/app.asar" -t \
    "${pkgdir}/usr/lib/dnschanger/"

  install -Dm644 public/icons/icon.png "${pkgdir}/usr/share/pixmaps/dnschanger.png"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  install -Dm755 "${srcdir}/dnschanger.sh" "${pkgdir}/usr/bin/dnschanger"
  install -Dm644 "${srcdir}/dnschanger.desktop" -t "${pkgdir}/usr/share/applications/"
}
