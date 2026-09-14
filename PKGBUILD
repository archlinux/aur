# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=cpak-bin
pkgver=2.13.3
pkgrel=2
pkgdesc="A fast, decentralized, portable, powerful and low-memory footprint package format for Linux."
arch=('x86_64' 'aarch64')
url="https://github.com/Containerpak/cpak"
license=('LGPL-2.1-only')
provides=('cpak')
conflicts=('cpak')
options=('!strip' '!debug')

depends=(
  'slirp4netns'
  'util-linux'
  'dbus'
  'polkit'
  'tar'
  'gzip'
  'xdg-utils'
)

optdepends=(
  'webkit2gtk-4.1: web preview adapter'
  'qt6-base: Qt UI adapter'
  'knotifications: KDE notifications'
  'gnome-keyring: Secret Service backend'
  'kwallet5: KWallet Secret Service backend'
)

source=("cpak-${pkgver}.tar.gz::https://github.com/Containerpak/cpak/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a6417c5cfc4e76cb574a0c174537788cb96ba2cd3bc7774537ce7d2d718f153')
sha256sums_x86_64=('1c842ae9eeccb071d948e2bf0360453f6b39edf011b585f3d0c4a77548c84b98'
                   'cc5ddf5fba5cbc9612b50cdb5fb9d5cfded3cd5d13297f1e8602b874f944aa40')
sha256sums_aarch64=('03055279aca7cb408f48cea9f0819103c247da0b08f19547a56abeaa9395438b'
                    'f19bcb33e71a06328b13c00cb0ed56c45cea4e163b0427c76e609f6d6b6c5c59')

source_x86_64=(
  "cpak-${pkgver}-linux-amd64::https://github.com/Containerpak/cpak/releases/download/v${pkgver}/cpak-linux-amd64"
  "cpak-${pkgver}-storaged-linux-amd64::https://github.com/Containerpak/cpak/releases/download/v${pkgver}/cpak-storaged-linux-amd64"
)

source_aarch64=(
  "cpak-${pkgver}-linux-arm64::https://github.com/Containerpak/cpak/releases/download/v${pkgver}/cpak-linux-arm64"
  "cpak-${pkgver}-storaged-linux-arm64::https://github.com/Containerpak/cpak/releases/download/v${pkgver}/cpak-storaged-linux-arm64"
)

package() {
  cd "cpak-${pkgver}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  case "$CARCH" in
    x86_64)  _suffix=amd64 ;;
    aarch64) _suffix=arm64 ;;
  esac

  install -Dm755 "${srcdir}/cpak-${pkgver}-linux-${_suffix}" \
    "${pkgdir}/usr/bin/cpak"

  install -Dm755 "${srcdir}/cpak-${pkgver}-storaged-linux-${_suffix}" \
    "${pkgdir}/usr/lib/cpak/cpak-storaged"

  chmod +x "${srcdir}/cpak-${pkgver}-linux-${_suffix}"
  "${srcdir}/cpak-${pkgver}-linux-${_suffix}" completion bash > cpak.bash
  "${srcdir}/cpak-${pkgver}-linux-${_suffix}" completion zsh > _cpak
  "${srcdir}/cpak-${pkgver}-linux-${_suffix}" completion fish > cpak.fish
  install -Dm644 cpak.bash "${pkgdir}/usr/share/bash-completion/completions/cpak"
  install -Dm644 _cpak "${pkgdir}/usr/share/zsh/site-functions/_cpak"
  install -Dm644 cpak.fish "${pkgdir}/usr/share/fish/vendor_completions.d/cpak.fish"
}
