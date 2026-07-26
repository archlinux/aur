# Maintainer: nugget <vincent@sshmoi.com>

pkgname=kickoutchi
pkgver=1.3.1
pkgrel=1
pkgdesc="TUI and CLI to see which process owns a local port and kill it safely"
arch=("x86_64" "aarch64")
url="https://github.com/nuggocto/kickoutchi"
license=("MIT")
depends=("gcc-libs")
makedepends=("cargo")
conflicts=("kickoutchi-bin")
options=("!debug" "!lto")
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/source.tar.gz")
sha256sums=("5fc9f45e304632264bf0b8ac65e254ef1c4572d3d9fbc8b3c21047b2043ec0d7")

_cargo() {
  RUSTC=/usr/bin/rustc RUSTDOC=/usr/bin/rustdoc /usr/bin/cargo "$@"
}

prepare() {
  cd "${pkgname}-${pkgver}"
  _cargo fetch --locked
}

build() {
  cd "${pkgname}-${pkgver}"
  _cargo build --frozen --release --all-features --bin kickoutchi --bin kick
}

check() {
  cd "${pkgname}-${pkgver}"
  _cargo test --frozen --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/kickoutchi" "${pkgdir}/usr/bin/kickoutchi"
  install -Dm755 "target/release/kick" "${pkgdir}/usr/bin/kick"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
  install -d "${pkgdir}/usr/share/kickoutchi"
  printf '%s\n' aur > "${pkgdir}/usr/share/kickoutchi/install-provenance"
}
