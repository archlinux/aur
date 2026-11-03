# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=aries-connect
pkgver=0.3.0
pkgrel=1
pkgdesc="KDE Connect-compatible daemon exposing devices over D-Bus (no KDE/Qt dependencies)"
arch=('x86_64')
url="https://github.com/Frikilinux/aries-connect"
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
)
makedepends=(cargo)
options=(!lto)
source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('e1da47890a25aad2eacf9336a253ad1346bea3a79bb252e018f67fd7e57ae02a')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
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
  install -Dm755 target/release/aries-connect "${pkgdir}/usr/bin/aries-connect"
  install -Dm644 contrib/aries-connect.service \
    "${pkgdir}/usr/lib/systemd/user/aries-connect.service"
  for f in doc/*; do
    install -Dm 644 "$f" "${pkgdir}/usr/share/doc/${_pkgname}/$(basename "$f")"
  done
}
