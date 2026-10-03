# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-local-agent-bin
pkgver=0.2.0
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
sha256sums_x86_64=('b226311a10f7368019011ae0d666d04e3f1abe5e94940b73d84c727da1fe07c1')
sha256sums_aarch64=('cb9155d6bc6b6302fd8f4ff76954d128ab6ff024ac1ca6cd5be45b43d018ab64')

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
