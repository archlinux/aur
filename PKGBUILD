# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Minzord
# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname="aura-git"
pkgver=4.0.0.r0.geaac6297
pkgrel=1
pkgdesc="A package manager for Arch Linux and its AUR"
arch=("any")
url="https://github.com/fosskers/aura"
license=("GPL3")
depends=("git" "curl" "openssl" "gcc-libs" "glibc")
makedepends=("cargo")
optdepends=(
  "ripgrep: faster log searches"
  "fd: faster filesystem traversal"
  "bat: more featureful file viewing")
provides=("aura")
conflicts=("aura" "aura-bin")
replaces=()
options=("strip")
source=("${pkgname}"::"git+https://github.com/fosskers/aura.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
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

  # Install bash and zsh completions
  install -Dm644 "misc/completions/bashcompletion.sh" "${pkgdir}/usr/share/bash-completion/completions/aura"
  install -Dm644 "misc/completions/_aura" "${pkgdir}/usr/share/zsh/site-functions/_aura"
}
