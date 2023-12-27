# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor: Márton Szabó < echo "bm90cmFtb0B2aXBtYWlsLmh1Cg=="|base64 -d >

pkgname=tokei-git
epoch=1
pkgver=13.0.0_alpha.0.r986.e2625c0
pkgrel=1
pkgdesc='A blazingly fast CLOC(Count Lines Of Code) program'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/XAMPPRocky/${pkgname%-git}"
license=('MIT' 'Apache')
makedepends=(git rust cargo coreutils sed gcc)
options=(!lto)
depends=(gcc-libs glibc)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
_git_folder="${pkgname%-git}"
source=("${_git_folder}::git+$url.git")
sha256sums=(SKIP)

pkgver() {
  cd "${_git_folder}"
  printf "%s.r%s.%s" \
    "$(cargo pkgid | cut -d# -f2 | cut -d@ -f2 | cut -d: -f2 | sed 's/-/_/g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_git_folder}"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
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

  install -Dm644 LICENCE-MIT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
  install -Dm644 LICENCE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
