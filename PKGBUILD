# Maintainer: Marek <mail@marek.onl>

pkgname=zebrad
pkgver=2.3.0
pkgrel=3
pkgdesc="A Zcash full node"
url='https://github.com/ZcashFoundation/zebra'
source=("zebra-${pkgver//_/-}.tar.gz::${url}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
arch=('aarch64' 'x86_64')
license=('Apache' 'MIT')
makedepends=('rust' 'clang' 'pkgconf')
sha256sums=(SKIP)
options=(!debug !lto)

build() {
  cd "zebra-$pkgver" || exit

  # Build Zebra.
  export CXXFLAGS="$CXXFLAGS -include cstdint"
  cargo build --locked --release --features sentry --package zebrad --bin zebrad --target-dir target
}

package() {
  cd "zebra-$pkgver" || exit

  # Install the binary.
  install -Dm 755 target/release/zebrad "${pkgdir}/usr/bin/${pkgname}"

  # Install documentation.
  install -Dm 644 CHANGELOG.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 CODE_OF_CONDUCT.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 CONTRIBUTING.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 SECURITY.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Install licenses.
  install -Dm 644 LICENSE-{APACHE,MIT} -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
