# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=aura
pkgver=4.0.2
pkgrel=1
pkgdesc="A package manager for Arch Linux and its AUR"
url="https://github.com/fosskers/aura"
license=('GPL-3.0-or-later')
arch=("x86_64")
depends=("git" "curl" "openssl" "gcc-libs" "glibc")
makedepends=("cargo" "texinfo")
optdepends=(
  "bash-completion: for bash completions"
  "bat: more featureful file viewing"
  "fd: faster filesystem traversal"
  "graphviz: dependency graph generation"
  "ripgrep: faster log searches"
  "shellcheck: PKGBUILD scanning"
)
conflicts=("aura-bin" "aura-git" "aura3-bin")
options=("strip")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('88c5a6dd3fca36c1b321f5e8957e5b09e3b581aeeffad473f07449be4925fc79')

prepare() {
  cd "${pkgname}-${pkgver}/rust"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}/rust"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  # Build the `info` page.
  cd "../misc"
  makeinfo aura.texi
}

package() {
  cd "${pkgname}-${pkgver}"

  # Install binary
  install -Dm0755 -t "$pkgdir/usr/bin/" "rust/target/release/aura"

  # Install man and info pages
  install -Dm644 "misc/aura.8" "${pkgdir}/usr/share/man/man8/aura.8"
  install -Dm644 "misc/aura.info" "${pkgdir}/usr/share/info/aura.info"

  # Install bash and zsh completions
  install -Dm644 "misc/completions/bashcompletion.sh" "${pkgdir}/usr/share/bash-completion/completions/aura"
  install -Dm644 "misc/completions/_aura" "${pkgdir}/usr/share/zsh/site-functions/_aura"
}
