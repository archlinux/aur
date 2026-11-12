pkgname=vleer-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Music, but without the subscription'
arch=('x86_64' 'aarch64')
url='https://vleer.app'
license=('AGPL-3.0-only')
depends=('alsa-lib' 'fontconfig' 'libxcb' 'libxkbcommon' 'libxkbcommon-x11' 'vulkan-icd-loader')
makedepends=('minisign')
optdepends=('wayland: Wayland support')
provides=('vleer')
conflicts=('vleer' 'vleer-nightly-bin' 'vleer-git')
options=('!strip' '!debug')

source_x86_64=("https://cdn.vleer.app/release/Vleer-${pkgver}-x86_64.tar.gz"
               "https://cdn.vleer.app/release/Vleer-${pkgver}-x86_64.tar.gz.minisig")
source_aarch64=("https://cdn.vleer.app/release/Vleer-${pkgver}-aarch64.tar.gz"
                "https://cdn.vleer.app/release/Vleer-${pkgver}-aarch64.tar.gz.minisig")
sha256sums_x86_64=('95100f5a4e765bf99b301828626b5caea8b38c9d5f9671a0c180d1ad29fdb53d'
                   'SKIP')
sha256sums_aarch64=('53de2a4b2f05956092da85bec0bda063130edfeefa7ca3dd95e76bad19effb98'
                    'SKIP')

prepare() {
  minisign -Vm "Vleer-${pkgver}-${CARCH}.tar.gz" -P 'RWRh5nLZjKooTcjP0/fbHq6xIgU9c+QhLjaVPg6gqWv1MuNRV1RWgu28'
}

package() {
  cd "vleer-${pkgver}-${CARCH}"

  install -Dm755 bin/vleer "${pkgdir}/usr/bin/vleer"
  install -Dm644 share/applications/vleer.desktop "${pkgdir}/usr/share/applications/vleer.desktop"
  for size in 128 256 512; do
    install -Dm644 "share/icons/hicolor/${size}x${size}/apps/vleer.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/vleer.png"
  done
  install -Dm644 share/vleer/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
