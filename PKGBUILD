# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=cargo-bisect-rustc-git
pkgver=0.6.7.r557.9af234f
pkgrel=1
pkgdesc='Bisects rustc, either nightlies or CI artifacts'
arch=('x86_64' 'aarch64')
url="https://github.com/rust-lang/cargo-bisect-rustc"
license=('MIT' 'Apache')
makedepends=(git rust cargo coreutils sed gcc)
options=(!lto)
depends=(gcc-libs glibc openssl "libgit2.so" "liblzma.so")
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
  export CARGO_TARGET_DIR=./target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_git_folder}"
  cargo test --frozen --all-features
}

package() {
  cd "${_git_folder}"
  install -Dm755 target/release/"${pkgname%-git}" -t "$pkgdir/usr/bin/"

  install -Dm644 LICENSE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
