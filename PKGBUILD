# Maintainer: futpib <futpib@gmail.com>

_pkgname=iroh
pkgbase="${_pkgname}-relay-git"
pkgname=("${_pkgname}-relay-git" "${_pkgname}-dns-server-git")
pkgver=0.96.1.r16.gb11e707cc8
pkgrel=1
pkgdesc="p2p QUIC connections dialed by public key"
arch=('x86_64' 'aarch64')
url="https://github.com/n0-computer/iroh"
license=('MIT OR Apache-2.0')
makedepends=('rust' 'cargo' 'git' 'clang')
options=(!lto)
source=("git+https://github.com/n0-computer/iroh.git"
        'iroh-relay.service'
        'iroh-relay.sysusers'
        'iroh-relay.toml'
        'iroh-dns-server.service'
        'iroh-dns-server.sysusers'
        'iroh-dns-server.toml')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release -p iroh-relay --features server
  cargo build --release -p iroh-dns-server
}

package_iroh-relay-git() {
  pkgdesc="Iroh's relay server"
  depends=('gcc-libs')
  provides=('iroh-relay')
  conflicts=('iroh-relay')
  backup=('etc/iroh-relay.toml')

  cd "${srcdir}/${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/iroh-relay"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "${srcdir}/../iroh-relay.service" "${pkgdir}/usr/lib/systemd/system/iroh-relay.service"
  install -Dm644 "${srcdir}/../iroh-relay.sysusers" "${pkgdir}/usr/lib/sysusers.d/iroh-relay.conf"
  install -Dm644 "${srcdir}/../iroh-relay.toml" "${pkgdir}/etc/iroh-relay.toml"
}

package_iroh-dns-server-git() {
  pkgdesc="A pkarr relay and DNS server"
  depends=('gcc-libs')
  provides=('iroh-dns-server')
  conflicts=('iroh-dns-server')
  backup=('etc/iroh-dns-server.toml')

  cd "${srcdir}/${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/iroh-dns-server"
  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
  install -Dm644 "${srcdir}/../iroh-dns-server.service" "${pkgdir}/usr/lib/systemd/system/iroh-dns-server.service"
  install -Dm644 "${srcdir}/../iroh-dns-server.sysusers" "${pkgdir}/usr/lib/sysusers.d/iroh-dns-server.conf"
  install -Dm644 "${srcdir}/../iroh-dns-server.toml" "${pkgdir}/etc/iroh-dns-server.toml"
  install -Dm644 iroh-dns-server/config.dev.toml "${pkgdir}/usr/share/doc/iroh-dns-server/config.dev.toml"
  install -Dm644 iroh-dns-server/config.prod.toml "${pkgdir}/usr/share/doc/iroh-dns-server/config.prod.toml"
}
