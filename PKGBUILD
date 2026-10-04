# Maintainer: Rijuyuezhu <rijuyuezhu@users.noreply.github.com>
pkgname=websudo-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Local browser askpass helper for sudo commands.'
arch=('x86_64' 'aarch64')
url='https://github.com/rijuyuezhu/websudo'
license=('MIT')
depends=('systemd')
optdepends=('sudo: default sudo-compatible executable'
            'sudo-rs: alternative sudo-compatible executable; configure WEBSUDO_SUDO_PATH')
provides=('websudo')
conflicts=('websudo')
install=websudo-bin.install
options=('!strip')
source_x86_64=("websudo-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/websudo-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("websudo-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/websudo-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('9867110a3563efffe9207deb262f6403b9982855c1265c71e627a6be022b9f7f')
sha256sums_aarch64=('36fa26211df10007ac662af18142d82b5177a3de3ae1db5aba222547773d839c')

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
  install -Dm644 packaging/systemd/websudo-approverd.service "${pkgdir}/usr/lib/systemd/user/websudo-approverd.service"
  install -Dm644 README.md "${pkgdir}/usr/share/websudo/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
