pkgname=vleer-nightly-bin
pkgver=0.1.0_nightly.20261110.433
pkgrel=1
pkgdesc='Music, but without the subscription (nightly build)'
arch=('x86_64' 'aarch64')
url='https://vleer.app'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'fontconfig' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader')
makedepends=('minisign')
optdepends=('wayland: Wayland support')
provides=('vleer')
conflicts=('vleer' 'vleer-bin' 'vleer-git')
options=('!strip' '!debug')

_ver=${pkgver//_/-}

source_x86_64=("https://cdn.vleer.app/nightly/Vleer-${_ver}-x86_64.tar.gz"
               "https://cdn.vleer.app/nightly/Vleer-${_ver}-x86_64.tar.gz.minisig")
source_aarch64=("https://cdn.vleer.app/nightly/Vleer-${_ver}-aarch64.tar.gz"
                "https://cdn.vleer.app/nightly/Vleer-${_ver}-aarch64.tar.gz.minisig")
sha256sums_x86_64=('4b3c853c05934d4fa8203ea13000389ec69db3a3ae66c82704cec6bd5e0da668'
                   'SKIP')
sha256sums_aarch64=('e79bcd395a0e6306b46ce4af471160a2cd93d52a197b7d83d1dda4bb9574f82e'
                    'SKIP')

prepare() {
  minisign -Vm "Vleer-${_ver}-${CARCH}.tar.gz" -P 'RWRh5nLZjKooTcjP0/fbHq6xIgU9c+QhLjaVPg6gqWv1MuNRV1RWgu28'
}

package() {
  cd "vleer-${_ver}-${CARCH}"

  install -Dm755 bin/vleer "${pkgdir}/usr/bin/vleer"
  install -Dm644 share/applications/vleer.desktop "${pkgdir}/usr/share/applications/vleer.desktop"
  for size in 128 256 512; do
    install -Dm644 "share/icons/hicolor/${size}x${size}/apps/vleer.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/vleer.png"
  done
  install -Dm644 share/vleer/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
