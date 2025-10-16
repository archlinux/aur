# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=zizmor-git
pkgver=1.15.2.r908.ac4cab32
pkgrel=1
pkgdesc='A static analysis tool for GitHub Actions'
arch=('x86_64')
url="https://github.com/woodruffw/${pkgname%-git}"
license=("MIT")
makedepends=(git cargo)
options=(!lto)
depends=(gcc-libs glibc)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
_git_folder="${pkgname%-git}"
source=("${_git_folder}::git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "${_git_folder}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "${_git_folder}"
  printf "%s.r%s.%s" \
    "$(cargo pkgid --package zizmor | cut -d# -f2 | cut -d@ -f2 | cut -d: -f2 | sed 's/-/_/g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_git_folder}"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "${_git_folder}"
  cargo test --frozen
}

package() {
  cd "${_git_folder}"
  install -Dm755 target/release/"${pkgname%-git}" -t "$pkgdir/usr/bin/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
