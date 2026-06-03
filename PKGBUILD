# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=websudo-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Local browser askpass helper for sudo commands.'
arch=('x86_64' 'aarch64')
url='https://github.com/rijuyuezhu/websudo'
license=('MIT')
depends=('sudo' 'systemd')
provides=('websudo')
conflicts=('websudo')
options=('!strip')
source_x86_64=("websudo-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/websudo-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("websudo-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/websudo-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('b144133a3bd67e7c41759e085f3e3ab5aeecf67cee4c6563a2014cbff6c4ea19')
sha256sums_aarch64=('a3b92ecd06a1bc976cf24704b370eb7c8103107ad875e713b15bf41703173c4b')

package() {
  local target
  case "${CARCH}" in
    x86_64)
      target='x86_64-unknown-linux-gnu'
      ;;
    aarch64)
      target='aarch64-unknown-linux-gnu'
      ;;
    *)
      printf 'unsupported architecture: %s\n' "${CARCH}" >&2
      return 1
      ;;
  esac

  cd "${srcdir}/websudo-${target}"

  install -dm755 "${pkgdir}/etc/websudo"
  install -Dm755 websudo "${pkgdir}/usr/bin/websudo"
  install -Dm755 websudo-askpass "${pkgdir}/usr/bin/websudo-askpass"
  install -Dm755 websudo-approverd "${pkgdir}/usr/bin/websudo-approverd"
  install -Dm755 packaging/scripts/websudo-systemd-setup "${pkgdir}/usr/bin/websudo-systemd-setup"
  install -Dm644 packaging/systemd/websudo-approverd.service "${pkgdir}/usr/lib/systemd/user/websudo-approverd.service"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
