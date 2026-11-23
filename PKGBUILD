# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=cpak-bin
pkgver=2.14.19
pkgrel=1
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
sha256sums=('4d5ed559106fae82f8c7e9af202f29d769210f1e7e3c8282dd7e392d4635c0e6')
sha256sums_x86_64=('382010d4262bf0b4c4d51d5fd35d4b9a3e463275ed59342f351f8ee7a2553dee'
                   '3c0aa52fdd30846baf0a8f78b331ea3d80afaf368218ad50114a613b79923bee')
sha256sums_aarch64=('da61e6d0446f960d4f9cbb65bac38d201f0363a93c95394b24e8f29990a5b92f'
                    'cec58b1d22330e7db19cb9369edad562abb3ea84c902a432efb91f98a52e1526')

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

  # Upstream discovers the storage service beside cpak or on PATH.
  install -Dm755 "${srcdir}/cpak-${pkgver}-storaged-linux-${_suffix}" \
    "${pkgdir}/usr/bin/cpak-storaged"

  chmod +x "${srcdir}/cpak-${pkgver}-linux-${_suffix}"
  "${srcdir}/cpak-${pkgver}-linux-${_suffix}" completion bash > cpak.bash
  "${srcdir}/cpak-${pkgver}-linux-${_suffix}" completion zsh > _cpak
  "${srcdir}/cpak-${pkgver}-linux-${_suffix}" completion fish > cpak.fish
  install -Dm644 cpak.bash "${pkgdir}/usr/share/bash-completion/completions/cpak"
  install -Dm644 _cpak "${pkgdir}/usr/share/zsh/site-functions/_cpak"
  install -Dm644 cpak.fish "${pkgdir}/usr/share/fish/vendor_completions.d/cpak.fish"
}
