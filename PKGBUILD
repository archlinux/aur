# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>
# Contributor: Márton Szabó < echo "bm90cmFtb0B2aXBtYWlsLmh1Cg=="|base64 -d >

pkgname=tokei-git
epoch=1
pkgver=13.0.0_alpha.1.r1010.ba11288
pkgrel=1
pkgdesc='A blazingly fast CLOC(Count Lines Of Code) program'
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/XAMPPRocky/${pkgname%-git}"
license=("Apache-2.0 OR MIT")
makedepends=(git rust cargo coreutils sed gcc)
options=(!lto)
depends=(gcc-libs glibc)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
_git_folder="${pkgname%-git}"
source=("${_git_folder}::git+$url.git"
"slang.patch::https://github.com/XAMPPRocky/tokei/commit/0c8a61393e105e2cd80eab61a166fcc89cb4853a.patch"
"headache.patch::https://patch-diff.githubusercontent.com/raw/XAMPPRocky/tokei/pull/971.patch"
)
sha256sums=('SKIP'
            '9e3e103d7c46f7a83ec351da5edb6fff8c7931f0b3fdc8836fc7b41c3d88e633'
            '9140341fa58c1a4208ed2aacbe0bee43784391ca3ea099f2f3ddcd925bea1a3d')

pkgver() {
  cd "${_git_folder}"
  printf "%s.r%s.%s" \
    "$(cargo pkgid | cut -d# -f2 | cut -d@ -f2 | cut -d: -f2 | sed 's/-/_/g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_git_folder}"
  patch -N -p 1 -i ../slang.patch
  patch -R -p 1 -i ../headache.patch
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
