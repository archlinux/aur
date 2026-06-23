# Maintainer: Lukas Grumlik (Rakosn1cek) <rakosn1cek@zohomail.eu>
pkgname=oversight-git
pkgver=0.5.5
pkgrel=1
pkgdesc="Security Intelligence & Static Audit Engine for local scripts and raw web links"
arch=('x86_64')
url="https://github.com/Rakosn1cek/oversight"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Rakosn1cek/oversight/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo fetch --locked --target "$CARCH"
}

build() {
  cd "${pkgname}-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"
  
  # 1. Install production binary executable
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # 2. Install global rules engine definition data
  install -Dm644 "rules.json" "${pkgdir}/usr/share/oversight/rules.json"
  
  # 3. Install core system documentation and license profiles
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # 4. Deploy vendor shell completion & function wrappers natively
  install -Dm644 "oversight.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -Dm644 "oversight.zsh"  "${pkgdir}/usr/share/zsh/site-functions/oversight"
  install -Dm644 "oversight.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname}.fish"
}
