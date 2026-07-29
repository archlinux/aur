# Maintainer: lightjunction <lightjunction@users.noreply.github.com>

pkgname=matrixpost
pkgver=0.4.0
pkgrel=1
pkgdesc='Rust CLI, MCP server, and headless publication daemon for MatriXpost'
arch=('x86_64' 'aarch64')
url='https://github.com/lightjunction/MatriXpost'
license=('GPL-2.0-only')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust')
# v0.4.0 release commit, pinned so a moved tag cannot change the source.
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LIghtJUNction/MatriXpost/archive/f27f7f98176c1d18f999a96d108ca0ec46611391.tar.gz")
sha256sums=('1cc548dba7776ca007dc18e275523417f0dcbde685541baeb858f64750648547')

build() {
  cd "${srcdir}/MatriXpost-f27f7f98176c1d18f999a96d108ca0ec46611391"

  # Arch's -flto=auto leaks into vendored C static archives (ring and SQLite),
  # which clang cannot reliably link through rustc. Preserve the remaining
  # distribution hardening flags while disabling only that LTO setting here.
  CFLAGS="${CFLAGS//-flto=auto/}" CXXFLAGS="${CXXFLAGS//-flto=auto/}" \
    cargo build --frozen --release \
    --package matrixpost-cli \
    --package matrixpost-mcp \
    --package matrixpostd
}

package() {
  cd "${srcdir}/MatriXpost-f27f7f98176c1d18f999a96d108ca0ec46611391"

  install -Dm755 target/release/matrixpost "${pkgdir}/usr/bin/matrixpost"
  install -Dm755 target/release/matrixpost-mcp "${pkgdir}/usr/bin/matrixpost-mcp"
  install -Dm755 target/release/matrixpostd "${pkgdir}/usr/bin/matrixpostd"

  install -Dm644 deploy/matrixpostd.service \
    "${pkgdir}/usr/lib/systemd/system/matrixpostd.service"
  install -Dm644 deploy/matrixpostd.example.toml \
    "${pkgdir}/usr/share/doc/${pkgname}/matrixpostd.example.toml"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
