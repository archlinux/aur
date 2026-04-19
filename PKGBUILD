# Maintainer: Chris Snell
pkgname=graywolf-aprs
pkgver=0.10.1
pkgrel=1
pkgdesc='APRS radio transceiver, digipeater, and Internet gateway'
arch=('x86_64' 'aarch64')
url='https://github.com/chrissnell/graywolf'
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('go' 'rust' 'cargo' 'nodejs' 'npm')
backup=()
install=graywolf-aprs.install
source=("graywolf-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'graywolf-aprs.service'
        'graywolf-aprs.sysusers')
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "graywolf-${pkgver}"
  cd graywolf && go mod download
}

build() {
  cd "graywolf-${pkgver}"

  # Svelte frontend (populates web/dist for Go embed)
  cd graywolf/web
  npm install
  npm run build
  cd ../..

  # Go binary
  cd graywolf
  export CGO_ENABLED=0
  go build -trimpath \
    -ldflags "-w -s -X main.Version=${pkgver} -X main.GitCommit=${pkgver}" \
    -o "${srcdir}/graywolf" \
    ./cmd/graywolf/
  cd ..

  # Rust modem binary
  cd graywolf-modem
  export GRAYWOLF_VERSION="${pkgver}"
  export GRAYWOLF_GIT_COMMIT="${pkgver}"
  cargo build --release
  cd ..
  cp target/release/graywolf-modem "${srcdir}/graywolf-modem"
}

package() {
  cd "graywolf-${pkgver}"

  install -Dm755 "${srcdir}/graywolf"       "${pkgdir}/usr/bin/graywolf"
  install -Dm755 "${srcdir}/graywolf-modem" "${pkgdir}/usr/bin/graywolf-modem"
  install -Dm644 "${srcdir}/graywolf-aprs.service" \
    "${pkgdir}/usr/lib/systemd/system/graywolf-aprs.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/graywolf-aprs.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/graywolf-aprs.conf"
  install -Dm644 packaging/udev/99-graywolf-cm108.rules \
    "${pkgdir}/usr/lib/udev/rules.d/99-graywolf-cm108.rules"
}
