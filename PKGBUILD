# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=aries-connect
pkgver=0.4.0
pkgrel=1
pkgdesc="KDE Connect-compatible daemon exposing devices over D-Bus (no KDE/Qt dependencies)"
arch=('x86_64')
# url="https://github.com/Frikilinux/aries-connect"
url="https://gitlab.com/zotta/aries-connect"
license=(GPL-2.0-or-later)
depends=(
  glibc
  libgcc
)
makedepends=(cargo)
options=(!lto)
# source=(${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
source=(${url}/-/releases/v${pkgver}/downloads/${pkgname}-${pkgver}.tar.gz)
sha256sums=('9ce743a8d2de554d26e15765f423629ed0cbafdb49409b830d97cbc63fc1ca9b')

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
