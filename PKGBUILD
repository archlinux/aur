# Maintainer: Lukas Grumlik (Rakosn1cek) <rakosn1cek@zohomail.eu>
pkgname=oversight-git
pkgver=0.5.7.r0.g54321ab
pkgrel=1
pkgdesc="Security Intelligence & Static Audit Engine for local scripts and raw web links"
arch=("x86_64")
url="https://github.com/Rakosn1cek/oversight"
license=("MIT")
depends=("openssl")
makedepends=("cargo" "git")
source=("oversight::git+https://github.com/Rakosn1cek/oversight.git")
sha256sums=('SKIP')

pkgver() {
  cd "oversight"
  
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-\)*g//;s/-/./g'
}

prepare() {
  cd "oversight"
  export CARGO_HOME="${srcdir}/cargo-home"
  
  cargo fetch
}

build() {
  cd "oversight"
  export CARGO_HOME="${srcdir}/cargo-home"
  cargo build --frozen --release --all-features
}

package() {
  cd "oversight"
  
  install -Dm755 "target/release/oversight" "${pkgdir}/usr/bin/oversight"
  
  install -Dm644 "rules.json" "${pkgdir}/usr/share/oversight/rules.json"
  
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  install -Dm644 "oversight.bash" "${pkgdir}/usr/share/bash-completion/completions/oversight"
  install -Dm644 "oversight.zsh"  "${pkgdir}/usr/share/zsh/site-functions/oversight"
  install -Dm644 "oversight.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/oversight.fish"
}
