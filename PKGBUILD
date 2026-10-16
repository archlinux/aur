pkgname=slskr-bin
pkgver=0.2.67
pkgrel=3
pkgdesc='Rust Soulseek daemon with bundled Web UI'
arch=('x86_64' 'aarch64')
url='https://github.com/snapetech-org/slskr'
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
provides=('slskr')
conflicts=('slskr')
backup=('etc/slskr/config.toml')
source=(
  'slskr.service'
  'slskr.sysusers'
  'slskr.tmpfiles'
)
source_x86_64=("slskr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/snapetech-org/slskr/releases/download/release-v${pkgver}/slskr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("slskr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/snapetech-org/slskr/releases/download/release-v${pkgver}/slskr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('308ec26e906beb290ae7a18ca3a8f1a898cee0591923da3ac0d66d0791d9da25' '384dc783fd133eadcee6d9575eb41209fd231bd0728b815a5cf4af2ff6c43629' 'efbe26e7b0765a17276981f4694d30d3174cba6799588e7ae6590acdd1fe73d9')
sha256sums_x86_64=('361652fc9329e0d520fd620165f74ef1f7b6755d2f39872383ea21a5e562ce3d')
sha256sums_aarch64=('b00d093650cc11688c2b03587b6d367b90925af480e7ee477d6d7f7347b6b33d')

package() {
  local target
  case "$CARCH" in
    x86_64) target='x86_64-unknown-linux-gnu' ;;
    aarch64) target='aarch64-unknown-linux-gnu' ;;
    *) error "unsupported architecture: $CARCH"; return 1 ;;
  esac
  local root="${srcdir}/slskr-v${pkgver}-${target}"
  install -Dm755 "${root}/slskr" "${pkgdir}/usr/bin/slskr"
  install -Dm644 "${root}/docs/slskr.config.example.toml" "${pkgdir}/etc/slskr/config.toml"
  install -Dm644 "${srcdir}/slskr.service" "${pkgdir}/usr/lib/systemd/system/slskr.service"
  install -Dm644 "${srcdir}/slskr.sysusers" "${pkgdir}/usr/lib/sysusers.d/slskr.conf"
  install -Dm644 "${srcdir}/slskr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/slskr.conf"
  install -Dm644 "${root}/README.md" "${pkgdir}/usr/share/doc/slskr/README.md"
  install -Dm644 "${root}/LICENSE" "${pkgdir}/usr/share/licenses/slskr/LICENSE"
  mkdir -p "${pkgdir}/usr/share/slskr/web"
  cp -R "${root}/web/build" "${pkgdir}/usr/share/slskr/web/build"
}
