pkgname=slskr-bin
pkgver=0.2.36
pkgrel=3
pkgdesc='Rust Soulseek daemon with bundled Web UI'
arch=('x86_64' 'aarch64')
url='https://github.com/snapetech/slskr'
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
source_x86_64=("slskr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz::https://github.com/snapetech/slskr/releases/download/release-v${pkgver}/slskr-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("slskr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz::https://github.com/snapetech/slskr/releases/download/release-v${pkgver}/slskr-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3553ccff12888654c51848ae84c2ffec6fd35171a41ecfc4e7985553a59a90c9' '384dc783fd133eadcee6d9575eb41209fd231bd0728b815a5cf4af2ff6c43629' 'efbe26e7b0765a17276981f4694d30d3174cba6799588e7ae6590acdd1fe73d9')
sha256sums_x86_64=('2915289b109ec05ac4685b40722a0e35ac962657674c43f7e205351593094cd8')
sha256sums_aarch64=('529822e94b7701a30b8cd93eab1559f249f9d6590c44706add17b0ee45024f05')

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
