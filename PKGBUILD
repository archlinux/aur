# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=okolors-git
pkgver=0.4.0.r168.46ea1e2
pkgrel=1
pkgdesc='Generate a color palette from an image using k-means clustering in the Oklab color space'
arch=('x86_64')
url="https://github.com/Ivordir/Okolors"
license=(Apache)
makedepends=(git rust coreutils sed gcc meson ninja nasm cmake make)
options=(!lto)
depends=(gcc-libs glibc)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
_git_folder="${pkgname%-git}"
source=("${_git_folder}::git+$url.git")
sha256sums=(SKIP)

prepare() {
  cd "${_git_folder}/okolors-bin"
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

pkgver() {
  cd "${_git_folder}/okolors-bin"
  printf "%s.r%s.%s" \
    "$(cargo pkgid | cut -d# -f2 | cut -d@ -f2 | cut -d: -f2 | sed 's/-/_/g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_git_folder}/okolors-bin"
  export CARGO_TARGET_DIR=../target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_git_folder}/okolors-bin"
  cargo test --frozen --all-features
}

package() {
  cd "${_git_folder}"
  install -Dm755 target/release/"${pkgname%-git}" -t "$pkgdir/usr/bin/"
}
