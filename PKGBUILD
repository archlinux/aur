# Contributor: Frederic Bezies < fredbezies at gmail dot com >
# Contributor: Minzord
# Maintainer: Colin Woodbury <colin@fosskers.ca>

pkgname="aura-git"
pkgver=4.0.0.rc1.r8.g5b40bff1
pkgrel=1
pkgdesc="A package manager for Arch Linux and its AUR"
arch=("any")
url="https://github.com/fosskers/aura"
license=("GPL3")
depends=("git" "ripgrep" "fd" "curl" "openssl" "gcc-libs" "glibc")
makedepends=("cargo")
optdepends=()
provides=("aura")
conflicts=("aura" "aura-bin")
replaces=()
options=("strip")
source=("${pkgname}"::"git+https://github.com/fosskers/aura.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

prepare() {
  cd "${srcdir}/${pkgname}/rust"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}/rust"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${srcdir}/${pkgname}/rust"

  # Install binary
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/aura"

  cd "${srcdir}/${pkgname}/"

  # Install man page
  install -Dm644 "misc/aura.8" "${pkgdir}/usr/share/man/man8/aura.8"

  # Install bash and zsh completions
  install -Dm644 "misc/completions/bashcompletion.sh" "${pkgdir}/usr/share/bash-completion/completions/aura"
  install -Dm644 "misc/completions/_aura" "${pkgdir}/usr/share/zsh/site-functions/_aura"
}
