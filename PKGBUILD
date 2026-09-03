# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgbase=rucio
pkgname=('rucio' 'rucio-daemon' 'rucio-cli' 'rucio-bootstrap')
pkgver=0.44.0
pkgrel=1
pkgdesc='Decentralized peer-to-peer file sharing over libp2p, with eMule/Kad2 compatibility'
arch=('x86_64' 'aarch64')
url='https://github.com/ogarcia/rucio'
license=('GPL-3.0-or-later')
makedepends=('cargo' 'git' 'rust' 'rust-wasm' 'trunk')
options=('!buildflags')
source=("${pkgbase}-${pkgver}::git+https://github.com/ogarcia/rucio.git#tag=${pkgver}"
        "${pkgbase}-system.service"
        "${pkgbase}-user.service"
        "${pkgbase}-bootstrap.service")
b2sums=('2dadc804d08fd6b346c13608a09175caf72eab220c11165117ab0e30bb955d8b6ff55f5bb92e2c101127bcdfffac4cf9b1a6955acd3e5fadc524ec1162c1b3d2'
        '7906f2c641558dea0d6314b4609943b41e9a9bf5d64e83de688b95e2610074e298e9b87b1421729924807bf317277f87c8ebf2a39268bfaa75568fd34606296d'
        'a3c04268a6909af624a572331b021cf1d83621ea2156379739a9c851e54d672a2280a73784e53830163a9aa7a7e4bad7995fb3328d1c41fc509cabede342ccff'
        'dfb6bdf741a10441e67e250717f9a14a5d9ea1835bc3c510a2f083546503f32a4b4f06a2c05a050871b9aabfbde491189a5cdfd11c85af2cfabdae18b3e454e2')

prepare() {
  cd "${pkgbase}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$pkgbase-$pkgver"
  export CARGO_TARGET_DIR=target

  # Build the Leptos frontend first: the complete binary embeds it via rust-embed
  ( cd rucio-web && trunk build --release )

  # Complete client: fat binary with eMule + embedded web panel
  cargo build --frozen --release -p rucio --features emule-compat,web-ui

  # Server only: daemon with eMule support
  cargo build --frozen --release -p rucio-daemon --features emule-compat

  # Standalone CLI: no daemon, no web, no libp2p
  cargo build --frozen --release -p rucio-cli

  # Bootstrap server: DHT bootstrap node
  cargo build --frozen --release -p rucio-bootstrap --features web
}

package_rucio() {
  pkgdesc='Decentralized P2P file sharing - complete client (daemon + CLI + web panel + eMule)'
  depends=('gcc-libs')
  provides=('ruciod')
  conflicts=('rucio-daemon')

  cd "${pkgbase}-${pkgver}"

  # fat binary: `ruciod` runs the daemon, `rucio` runs the CLI
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
  conflicts=('rucio')

  cd "${pkgbase}-${pkgver}"

  # server only
  install -Dm755 target/release/ruciod "${pkgdir}/usr/bin/ruciod"

  # service
  install -D -m644 "${srcdir}/${pkgbase}-system.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgbase}.service"
}

package_rucio-cli() {
  pkgdesc='Decentralized P2P file sharing - standalone command-line client'
  depends=('gcc-libs')

  cd "${pkgbase}-${pkgver}"

  # lightweight client only
  install -Dm755 target/release/rucio-cli "${pkgdir}/usr/bin/rucio-cli"
}

package_rucio-bootstrap() {
  pkgdesc='Decentralized P2P file sharing - DHT bootstrap node'
  depends=('gcc-libs')

  cd "${pkgbase}-${pkgver}"

  # bootstrap server
  install -Dm755 target/release/rucio-bootstrap \
    "${pkgdir}/usr/bin/rucio-bootstrap"

  # service
  install -D -m644 "${srcdir}/${pkgbase}-bootstrap.service" \
    "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}
