# Maintainer: Riccardo Sacchetto <rsacchetto@nexxontech.it>
pkgname=sea-orm-cli
pkgver=0.6.0
pkgrel=1
pkgdesc="CLI for the Sea-Orm crate"
arch=('x86_64')
url="https://www.sea-ql.org/seaorm/"
license=('MIT' 'Apache')
depends=('sqlite' 'postgresql-libs' 'libmariadbclient')
makedepends=('cargo')
source=("https://github.com/SeaQL/sea-orm/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('ed37796d3a1ca3bb4c6d214aa939e8e5747071ff431cc2c84f38d70259281ca5c073f5671b051a7c3a2199bf4bb49b31c435e59f2cf4bd31a687e3bfa2a5d0a5')

prepare() {
  # Enter the sea-orm-cli source folder downloaded from GitHub
  cd "sea-orm-${pkgver}/sea-orm-cli"
  # A specific sea-orm-cli release requires the matching sea-schema version: update Cargo.toml to avoid errors
  sed -i 's/git = "https:\/\/github.com\/SeaQL\/sea-schema.git"/git = "https:\/\/github.com\/SeaQL\/sea-schema.git", tag = "0.5.0"/' Cargo.toml
  # Fetch the dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  # Enter the sea-orm-cli source folder downloaded from GitHub
  cd "sea-orm-${pkgver}/sea-orm-cli"
  # Build the binary with the "Release" profile (enables all the optimizations)
  cargo build --release
}

package() {
  # Enter the sea-orm source folder downloaded from GitHub
  cd "sea-orm-${pkgver}"
  # Install the compiled CLI tool
  install -Dm755 "sea-orm-cli/target/release/sea-orm-cli" "${pkgdir}/usr/bin/sea-orm-cli"
  # Install the license files
  install -Dm644 LICENSE-MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 LICENSE-APACHE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
