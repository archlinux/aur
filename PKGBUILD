# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-local-agent-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Chat with Work Local Agent: share folders with Chat with Work through four read-only tools"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/chatwithwork-local-agent"
license=('MIT OR Apache-2.0')
install="${pkgname}.install"
# The release binary is static (musl), so it links nothing at all.
depends=()
optdepends=('org.freedesktop.secrets: keep the device key in the Secret Service (GNOME Keyring, KWallet, KeePassXC)')
provides=('cww' 'chatwithwork-local-agent')
conflicts=('cww' 'chatwithwork-local-agent' 'chatwithwork-local-agent-git')
options=('!debug' '!strip')
_repo="https://github.com/crmne/chatwithwork-local-agent"
source_x86_64=("${_repo}/releases/download/v${pkgver}/cww-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("${_repo}/releases/download/v${pkgver}/cww-v${pkgver}-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('bd1aee9dc6c9a927ca6c8598ded4c8448c313c4c86ce45ca243a83935baaf1a8')
sha256sums_aarch64=('4fb3258e3ffd86a91aff1f024cfc7d5d3592348fe5a2b15889a27f6d98991d0f')

package() {
  local target
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-musl" ;;
    aarch64) target="aarch64-unknown-linux-musl" ;;
  esac
  local dir="${srcdir}/cww-v${pkgver}-${target}"
  install -Dm755 "${dir}/cww" "${pkgdir}/usr/bin/cww"
  install -Dm644 "${dir}/packaging/systemd/cww.service" "${pkgdir}/usr/lib/systemd/user/cww.service"
  install -Dm644 "${dir}/README.md" "${dir}/PROTOCOL.md" "${dir}/SECURITY.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 "${dir}/LICENSE-MIT" "${dir}/LICENSE-APACHE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
