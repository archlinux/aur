pkgname=slskr
pkgver=0.2.90
_release_tag=v0.2.90
pkgrel=3
pkgdesc='Rust Soulseek daemon with bundled Web UI'
arch=('x86_64' 'aarch64')
url='https://github.com/snapetech-org/slskr'
license=('AGPL-3.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'npm')
backup=('etc/slskr/config.toml')
source=(
  "slskr-${pkgver}.tar.gz::https://github.com/snapetech-org/slskr/archive/refs/tags/${_release_tag}.tar.gz"
  'slskr.service'
  'slskr.sysusers'
  'slskr.tmpfiles'
)
sha256sums=('SKIP' '308ec26e906beb290ae7a18ca3a8f1a898cee0591923da3ac0d66d0791d9da25' '384dc783fd133eadcee6d9575eb41209fd231bd0728b815a5cf4af2ff6c43629' 'efbe26e7b0765a17276981f4694d30d3174cba6799588e7ae6590acdd1fe73d9')

_source_root() {
  local root
  for root in "${srcdir}"/*; do
    if [[ -f "$root/Cargo.toml" ]]; then
      printf '%s\n' "$root"
      return
    fi
  done
  return 1
}

build() {
  cd "$(_source_root)"
  npm --prefix web ci
  npm --prefix web run build
  SLSKR_APP_VERSION="$pkgver" cargo build --release -p slskr --locked
}

package() {
  local root="$(_source_root)"
  install -Dm755 "${root}/target/release/slskr" "${pkgdir}/usr/bin/slskr"
  install -Dm644 "${root}/docs/slskr.config.example.toml" "${pkgdir}/etc/slskr/config.toml"
  install -Dm644 "${srcdir}/slskr.service" "${pkgdir}/usr/lib/systemd/system/slskr.service"
  install -Dm644 "${srcdir}/slskr.sysusers" "${pkgdir}/usr/lib/sysusers.d/slskr.conf"
  install -Dm644 "${srcdir}/slskr.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/slskr.conf"
  install -Dm644 "${root}/README.md" "${pkgdir}/usr/share/doc/slskr/README.md"
  install -Dm644 "${root}/LICENSE" "${pkgdir}/usr/share/licenses/slskr/LICENSE"
  mkdir -p "${pkgdir}/usr/share/slskr/web"
  cp -R "${root}/web/build" "${pkgdir}/usr/share/slskr/web/build"
}
