# Maintainer: mavxa

pkgname=vesselix-git
_pkgname=vesselix
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Lightweight local-first Docker dashboard"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/mavxa/Vesselix"
license=('MIT')
depends=('docker')
makedepends=('bun' 'git' 'rust')
provides=('vesselix')
conflicts=('vesselix' 'vesselix-bin')
source=('git+https://github.com/mavxa/Vesselix.git' 'vesselix.service')
sha256sums=('SKIP' 'SKIP')

pkgver() {
  cd "${srcdir}/Vesselix"
  git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || printf '0.1.0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/Vesselix"
  bun install --frozen-lockfile
  bun run build
  cargo build --release --manifest-path backend/Cargo.toml
}

package() {
  cd "${srcdir}/Vesselix"
  install -Dm755 "backend/target/release/vesselix" "${pkgdir}/usr/bin/vesselix"
  install -Dm644 "${srcdir}/vesselix.service" "${pkgdir}/usr/lib/systemd/system/vesselix.service"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/vesselix/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
