# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgbase=rucio
pkgname=('rucio' 'rucio-daemon' 'rucio-cli' 'rucio-bootstrap')
pkgver=0.1.0
pkgrel=1
pkgdesc='Decentralized peer-to-peer file sharing over libp2p, with eMule/Kad2 compatibility'
arch=('x86_64' 'aarch64')
url='https://github.com/ogarcia/rucio'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'git' 'rust' 'rust-wasm' 'trunk')
options=('!lto')
source=("${pkgbase}-${pkgver}::git+https://github.com/ogarcia/rucio.git#tag=${pkgver}"
        "${pkgbase}-system.service"
        "${pkgbase}-user.service"
        "${pkgbase}-bootstrap.service")
b2sums=('b03706549d5581a6253f0042f90f1ec15f074b188a035fc8b716cb69dbce1a683b6d1b361f3bb160792d6856331c994a28a73f5d5c80a67dd8ec7ead3fe1bc5e'
        'd2c0ba8ef4047784ef2104ad7a9e61cbc85edf0849ec3c2afab4eb6ebde6799fb5e6099bba825fd3b232a8a09d03854834fa5cb2cc3a027b457b8b336308ab08'
        'a3c04268a6909af624a572331b021cf1d83621ea2156379739a9c851e54d672a2280a73784e53830163a9aa7a7e4bad7995fb3328d1c41fc509cabede342ccff'
        '007be144a9a0526c4a7f3dc3f7056e41d2d4e0ab4075640654df2c29e061a2f475ab3727229f8af11973878b30be6d796d34e218050a150efc9b8a734ffb0741')

prepare() {
  cd "${pkgbase}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgbase-$pkgver"
  export CARGO_TARGET_DIR=target

  # Build the Leptos frontend first: the complete binary embeds it via
  # rust-embed, and the rucio-web package ships the same assets.
  ( cd rucio-web && trunk build --release )

  # Complete client: fat binary with eMule + embedded web panel.
  cargo build --frozen --release -p rucio --features emule-compat,web-ui

  # Server only: daemon with eMule
  cargo build --frozen --release -p rucio-daemon --features emule-compat

  # Standalone CLI: no daemon, no web, no libp2p.
  cargo build --frozen --release -p rucio-cli

  # Bootstrap server: DHT bootstrap node
  cargo build --frozen --release -p rucio-bootstrap --features indexer
}

package_rucio() {
  pkgdesc='Decentralized P2P file sharing - complete client (daemon + CLI + web panel + eMule)'
  depends=('gcc-libs')
  provides=('ruciod')
  optdepends=('rucio-web: serve the web panel from your own web server instead')

  cd "${pkgbase}-${pkgver}"

  # Fat binary: `ruciod` runs the daemon, `rucio` runs the CLI.
  install -Dm755 target/release/rucio "${pkgdir}/usr/bin/rucio"
  ln -s rucio "${pkgdir}/usr/bin/ruciod"

  # services
  install -D -m644 "${srcdir}/${pkgbase}-system.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -D -m644 "${srcdir}/${pkgbase}-user.service" \
    "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

package_rucio-daemon() {
  pkgdesc='Decentralized P2P file sharing - stand alone daemon'
  optdepends=('nginx: serve via reverse-proxy')
  provides=('ruciod')

  cd "${pkgbase}-${pkgver}"
  install -Dm755 target/release/ruciod "${pkgdir}/usr/bin/ruciod"

  # service
  install -D -m644 "${srcdir}/${pkgbase}-system.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

package_rucio-cli() {
  pkgdesc='Decentralized P2P file sharing - standalone command-line client'
  depends=('gcc-libs')

  cd "${pkgbase}-${pkgver}"

  # Lightweight client only.
  install -Dm755 target/release/rucio-cli "${pkgdir}/usr/bin/rucio-cli"
}

package_rucio-bootstrap() {
  pkgdesc='Decentralized P2P file sharing - DHT bootstrap node'
  depends=('gcc-libs')

  cd "${pkgbase}-${pkgver}"
  install -Dm755 target/release/rucio-bootstrap \
    "${pkgdir}/usr/bin/rucio-bootstrap"

  # service
  install -D -m644 "${srcdir}/${pkgbase}-bootstrap.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
