# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=websudo-bin
pkgver=0.1.2
pkgrel=1
pkgdesc='Local browser askpass helper for sudo commands.'
arch=('x86_64' 'aarch64')
url='https://github.com/rijuyuezhu/websudo'
license=('MIT')
depends=('sudo' 'systemd')
provides=('websudo')
conflicts=('websudo')
install=websudo-bin.install
options=('!strip')
source_x86_64=("websudo-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/websudo-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("websudo-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/websudo-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a5df63980da5ad2da4e8825811ffce1d5b6b87ae2e1d4a3e610146816059f51b')
sha256sums_aarch64=('70dbfcc11735ac704d37cce43d1b1362b4258e7cad0baf051f1567147418cf32')

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
  install -Dm644 packaging/websudo.env.example "${pkgdir}/etc/websudo/websudo.env.example"
  install -Dm755 websudo "${pkgdir}/usr/bin/websudo"
  install -Dm755 websudo-askpass "${pkgdir}/usr/bin/websudo-askpass"
  install -Dm755 websudo-approverd "${pkgdir}/usr/bin/websudo-approverd"
  install -Dm755 packaging/scripts/websudo-systemd-setup "${pkgdir}/usr/bin/websudo-systemd-setup"
  install -Dm644 packaging/systemd/websudo-approverd.service "${pkgdir}/usr/lib/systemd/user/websudo-approverd.service"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
