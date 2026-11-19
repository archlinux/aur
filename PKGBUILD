pkgname=vleer-nightly-bin
pkgver=0.2.1_nightly.20261119.444
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
sha256sums_x86_64=('2cd0a36529c726868a54fa1d839ab070a808bedec28623660eb329b484ab84f4'
                   'SKIP')
sha256sums_aarch64=('b6931eafc0f406f47e7c5d4e667754ff6754d278feaf9f57ee94ce5e2a45dbc7'
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
