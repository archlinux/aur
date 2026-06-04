# Maintainer: 9M2PJU <9m2pju@hamradio.my>
pkgname=graywolf-aprs-git
pkgver=0.13.15.r0.gHASH
pkgrel=1
pkgdesc='APRS radio transceiver, digipeater, and Internet gateway (git version)'
arch=('x86_64' 'aarch64')
url='https://github.com/chrissnell/graywolf'
license=('GPL-2.0-only')
depends=('glibc')
makedepends=('go' 'rust' 'cargo' 'nodejs' 'npm' 'git')
provides=('graywolf-aprs')
conflicts=('graywolf-aprs')
options=(!lto)
install=graywolf-aprs-git.install
source=('graywolf::git+https://github.com/chrissnell/graywolf.git'
        'graywolf-aprs-git.service'
        'graywolf-aprs-git.sysusers')
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd graywolf
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' ||
    printf "%s.r%s.g%s" "$(cat VERSION)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd graywolf
  go mod download
}

build() {
  cd graywolf

  # Svelte frontend (populates web/dist for Go embed)
  cd web
  npm install
  npm run build
  cd ..

  # Go binary
  export CGO_ENABLED=0
  go build -trimpath \
    -ldflags "-w -s -X main.Version=${pkgver} -X main.GitCommit=$(git rev-parse --short HEAD)" \
    -o "${srcdir}/graywolf-bin" \
    ./cmd/graywolf/

  # Rust modem binary
  cd graywolf-modem
  export GRAYWOLF_VERSION="${pkgver}"
  export GRAYWOLF_GIT_COMMIT="$(git rev-parse --short HEAD)"
  cargo build --release
  cd ..
  cp target/release/graywolf-modem "${srcdir}/graywolf-modem"
}

package() {
  cd graywolf

  install -Dm755 "${srcdir}/graywolf-bin"   "${pkgdir}/usr/bin/graywolf"
  install -Dm755 "${srcdir}/graywolf-modem" "${pkgdir}/usr/bin/graywolf-modem"
  install -Dm644 "${srcdir}/graywolf-aprs-git.service" \
    "${pkgdir}/usr/lib/systemd/system/graywolf-aprs.service"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/graywolf-aprs-git.sysusers" \
    "${pkgdir}/usr/lib/sysusers.d/graywolf-aprs.conf"
  install -Dm644 packaging/udev/99-graywolf-cm108.rules \
    "${pkgdir}/usr/lib/udev/rules.d/99-graywolf-cm108.rules"
}
