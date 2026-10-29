# Maintainer: CPT-Dawn <dev@cptdawn.dev>
pkgname=lucent
_reponame=Lucent
pkgver=2.0.1
pkgrel=1
pkgdesc="The lightest notification daemon for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Lucent"
license=('MIT')
depends=('cairo' 'pango' 'glib2' 'dbus' 'libgcc' 'glibc')
makedepends=('cargo')
provides=("lucent")
source=("https://github.com/CPT-Dawn/Lucent/archive/refs/tags/v2.0.1.tar.gz")
sha256sums=('5dc25ddab8ddc41e9c57457d8c868e2b67a202d63bd16498fe6936857498a655')

build() {
  cd "${_reponame}-${pkgver}"
  export CARGO_TARGET_DIR="target"
  # Packed relocations: about 6% off the binary and no startup relocation
  # pass. Arch's glibc is new enough; generic source builds leave it out.
  export RUSTFLAGS="${RUSTFLAGS:-} -C link-arg=-Wl,-z,pack-relative-relocs"
  cargo build --release --locked
}

package() {
  cd "${_reponame}-${pkgver}"

  install -Dm755 "target/release/lucent" "${pkgdir}/usr/bin/lucent"

  install -Dm644 \
    "dev.cptdawn.Lucent.service" \
    "${pkgdir}/usr/share/dbus-1/services/dev.cptdawn.Lucent.service"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 default_config.toml "${pkgdir}/usr/share/doc/${pkgname}/config.toml"
}
