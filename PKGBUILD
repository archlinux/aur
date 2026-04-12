# Maintainer: Chris Snell <late.chart9064 at chrissnell dott com>
pkgname=graywolf
pkgver=0.7.18
pkgrel=1
pkgdesc='APRS radio transceiver, digipeater, and Internet gateway'
arch=('x86_64' 'aarch64')
url='https://github.com/chrissnell/graywolf'
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('go' 'rust' 'cargo' 'nodejs' 'npm')
backup=()
install=graywolf.install
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'graywolf.service'
        'graywolf.sysusers')
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  cd graywolf && go mod download
}

build() {
  cd "${pkgname}-${pkgver}"

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
  cd "${pkgname}-${pkgver}"

  install -Dm755 "${srcdir}/graywolf"       "${pkgdir}/usr/bin/graywolf"
  install -Dm755 "${srcdir}/graywolf-modem" "${pkgdir}/usr/bin/graywolf-modem"
  install -Dm644 "${srcdir}/graywolf.service" \
    "${pkgdir}/usr/lib/systemd/system/graywolf.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/graywolf.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/graywolf.conf"
}
