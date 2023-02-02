# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=n2-git
pkgver=0.1.0.r292.d64412a
pkgrel=1
pkgdesc='n2 ("into"), a ninja compatible build system'
arch=('x86_64' 'aarch64')
url="https://github.com/evmar/n2"
license=(Apache)
makedepends=(git rust coreutils sed gcc)
options=(!lto)
depends=(gcc-libs glibc)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
_git_folder="${pkgname%-git}"
source=("${_git_folder}::git+$url.git")
sha256sums=(SKIP)

prepare() {
  cd "${_git_folder}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

pkgver() {
  cd "${_git_folder}"
  printf "%s.r%s.%s" \
    "$(cargo pkgid | cut -d# -f2 | cut -d@ -f2 | cut -d: -f2 | sed 's/-/_/g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_git_folder}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

# check() {
#   cd "${_git_folder}"
#   export RUSTUP_TOOLCHAIN=stable
#   cargo test --frozen --all-features
# }

package() {
  cd "${_git_folder}"
  install -Dm755 target/release/"${pkgname%-git}" -t "$pkgdir/usr/bin/"

  install -d "${pkgdir}/usr/lib/n2/bin"
  ln -s /usr/bin/n2 "${pkgdir}/usr/lib/n2/bin/ninja"
}
