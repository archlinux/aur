pkgname=vleer-bin
pkgver=0.1.0
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
sha256sums_x86_64=('0e09e1ecb8360293d26a45cf7de6886974eb244a962c528ac356ad2a1889150f'
                   'SKIP')
sha256sums_aarch64=('ba95494ea4b8d30667e857c90f6691c65101f489ad059c975c7b85bc2befd6b1'
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
