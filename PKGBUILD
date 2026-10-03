# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=chatwithwork-local-agent
pkgver=0.2.0
pkgrel=1
pkgdesc="Chat with Work Local Agent: share folders with Chat with Work through four read-only tools"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/chatwithwork-local-agent"
license=('MIT OR Apache-2.0')
install="${pkgname}.install"
depends=('gcc-libs' 'glibc')
makedepends=('cargo')
optdepends=('org.freedesktop.secrets: keep the device key in the Secret Service (GNOME Keyring, KWallet, KeePassXC)')
provides=('cww')
conflicts=('cww' 'chatwithwork-local-agent-bin' 'chatwithwork-local-agent-git')
# !lto because ring compiles its own C and Arch's default CFLAGS put LTO
# objects in the archive, which the linker then cannot resolve. !debug
# because the release profile strips symbols, so a debug package would be
# empty.
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/crmne/chatwithwork-local-agent/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('10fa62bf27039ad805a231560aaa2b1c36c66929ff9693bdc53115f0d836cc91')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 target/release/cww "${pkgdir}/usr/bin/cww"
  install -Dm644 packaging/systemd/cww.service "${pkgdir}/usr/lib/systemd/user/cww.service"
  install -Dm644 README.md PROTOCOL.md SECURITY.md -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dm644 LICENSE-MIT LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
