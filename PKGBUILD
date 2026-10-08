# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=cpak-bin
pkgver=2.14.4
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
sha256sums=('d2a5519a2da3ded0518d46861d47338db356de685af5cad63eeb02c02d104bfd')
sha256sums_x86_64=('7ad3f984cf1ac53229553e84a8fa3211eb539783dbb5314cffc39679c41e5863'
                   '9f942fc8d9a6b649f2e7189b525151fed041773a1d1f80128b41638ce8fbca2a')
sha256sums_aarch64=('d8c71693e2c245d891eb8774ee7c86087902d70a694922d1faebad00564f7b1d'
                    'f841becfcf9504bd4726b8a55aca0f798e37bf55222d068f84ac1759fa464d91')

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
