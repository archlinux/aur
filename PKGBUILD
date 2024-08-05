# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname=aura
pkgver=4.0.1
pkgrel=1
pkgdesc="A package manager for Arch Linux and its AUR"
url="https://github.com/fosskers/aura"
license=('GPL-3.0-or-later')
arch=("x86_64")
depends=("git" "curl" "openssl" "gcc-libs" "glibc")
makedepends=("cargo")
optdepends=(
  "bash-completion: for bash completions"
  "bat: more featureful file viewing"
  "fd: faster filesystem traversal"
  "ripgrep: faster log searches"
  "shellcheck: PKGBUILD scanning"
)
conflicts=("aura-bin" "aura-git" "aura3-bin")
options=("strip")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e12d7f1730011ee7b08acf7dc38d9e5c68699384a94be0f726e48f54a6706477')

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
