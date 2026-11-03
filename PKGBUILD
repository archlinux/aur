# Maintainer: CPT-Dawn <ping@cptdawn.dev>
pkgname=lucent
_reponame=Lucent
pkgver=2.1.0
pkgrel=2
pkgdesc="The lightest notification daemon for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/CPT-Dawn/Lucent"
license=('MIT')
depends=('cairo' 'pango' 'glib2' 'dbus' 'libgcc' 'glibc')
optdepends=('wireplumber: lucent osd volume and mic'
            'brightnessctl: lucent osd brightness')
makedepends=('cargo')
provides=("lucent")
source=("https://github.com/CPT-Dawn/Lucent/archive/refs/tags/v2.1.0.tar.gz")
sha256sums=('467ee61e79096a7d2564f81e5a8c720728d07a4188b4c3e62f0b37035f574731')

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
