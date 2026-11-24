# Maintainer: agony <27015 at riseup dot net>

pkgname=iottack
pkgver=0.4.0
pkgrel=1
pkgdesc='IoT protocol testing framework'
arch=('x86_64' 'aarch64')
url='https://github.com/inradii/iottack'
license=('MIT')
depends=('dbus' 'glib2' 'glibc' 'libgcc' 'libsigrok')
makedepends=('cargo' 'clang' 'libsigrokdecode')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f1b8f861cab381e0a735814a042dedc864b7218e4bceb779c0164074576b722f')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i '/^name = "iottack"$/{n;s/^version = .*/version = "'"${pkgver}"'"/}' Cargo.lock
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target host-tuple
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS} -A clashing_extern_declarations"
  cargo build --frozen --release
}

check() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 target/release/iottack -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
