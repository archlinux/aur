# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Minzord
# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname="aura-git"
pkgver=4.0.8.r0.g446c12e
pkgrel=1
pkgdesc="A package manager for Arch Linux and its AUR"
arch=("x86_64")
url="https://github.com/fosskers/aura"
license=("GPL-3.0-or-later")
depends=("git" "curl" "openssl" "gcc-libs" "glibc")
makedepends=("cargo")
optdepends=(
  "bash-completion: for bash completions"
  "bat: more featureful file viewing"
  "fd: faster filesystem traversal"
  "graphviz: dependency graph generation"
  "ripgrep: faster log searches"
  "shellcheck: PKGBUILD scanning"
  "xdg-utils: for xdg-open"
)
provides=("aura")
conflicts=("aura" "aura-bin" "aura3-bin")
replaces=()
options=("strip")
source=("${pkgname}"::"git+https://github.com/fosskers/aura.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}/rust"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}/rust"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release

  # Build the `info` page.
  cd "../misc"
  makeinfo aura.texi
}

package() {
  cd "${pkgname}"

  # Install binary
  install -Dm0755 -t "$pkgdir/usr/bin/" "rust/target/release/aura"

  # Install man and info pages
  install -Dm644 "misc/aura.8" "${pkgdir}/usr/share/man/man8/aura.8"
  install -Dm644 "misc/aura.info" "${pkgdir}/usr/share/info/aura.info"

  # Install completions
  install -Dm644 "misc/completions/bashcompletion.sh" "${pkgdir}/usr/share/bash-completion/completions/aura"
  install -Dm644 "misc/completions/_aura" "${pkgdir}/usr/share/zsh/site-functions/_aura"
  install -Dm644 "misc/completions/aura.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/aura.fish"
}
