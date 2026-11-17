# Maintainer: FableStream <https://github.com/FableStream>
#
# Generic Arch packaging for pacoflexo, suitable for the AUR: it builds the
# tagged release tarball from GitHub. On a version bump, run `updpkgsums` to pin
# the tarball checksum and regenerate .SRCINFO with
# `makepkg --printsrcinfo > .SRCINFO`.

pkgname=pacoflexo
pkgver=0.1.2
pkgrel=1
pkgdesc='Verifying caching proxy for Arch Linux package repositories (flexo + pacoloco in one)'
arch=(x86_64 aarch64)
url='https://github.com/FableStream/pacoflexo'
license=('MIT OR Apache-2.0')
depends=(libgcc glibc archlinux-keyring)
makedepends=(cargo)
backup=(etc/pacoflexo/config.toml)
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  pacoflexo.service
  pacoflexo.sysusers
  pacoflexo.tmpfiles
  config.toml
)
sha256sums=('81417b5d8e74e08b26d3c8c628fa674ef0a0f4c35d17ed7a6d42d63474c4463e'
            '875b314bbc31706047b14c6049437a126475e2e924cdce13812bce46e4fdd23b'
            '6ea4efb828c819a6b8f78cd7d04795ff1f1827bc56405e112946aae22ed5351d'
            'e32af498bbc8f215e92748e9de7c278fbd6d7c47fdd67aee7b436d5fe0b979bf'
            '97b41dd7d685e5ec27f0c044c56bb106dc4ed6d680cc0ef440d022ffc6ecb205')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 config.example.toml "${pkgdir}/usr/share/doc/${pkgname}/config.example.toml"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}/"

  cd "${srcdir}"
  install -Dm644 config.toml "${pkgdir}/etc/pacoflexo/config.toml"
  install -Dm644 pacoflexo.service "${pkgdir}/usr/lib/systemd/system/pacoflexo.service"
  install -Dm644 pacoflexo.sysusers "${pkgdir}/usr/lib/sysusers.d/pacoflexo.conf"
  install -Dm644 pacoflexo.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/pacoflexo.conf"
}
