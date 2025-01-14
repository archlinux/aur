# Maintainer: SandaruKasa <sandarukasa plus aur at ya dot ru>

pkgname=n2-git
pkgver=0.1.0.r533.9c83053
pkgrel=1
pkgdesc='n2 ("into"), a ninja compatible build system'
arch=('x86_64' 'aarch64')
url="https://github.com/evmar/n2"
license=("Apache-2.0")
makedepends=(git cargo coreutils sed gcc)
options=(!lto)
depends=(gcc-libs glibc)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
_git_folder="${pkgname%-git}"
source=("${_git_folder}::git+$url.git")
sha256sums=(SKIP)

prepare() {
  cd "${_git_folder}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

pkgver() {
  cd "${_git_folder}"
  printf "%s.r%s.%s" \
    "$(cargo pkgid | cut -d# -f2 | cut -d@ -f2 | cut -d: -f2 | sed 's/-/_/g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_git_folder}"
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${_git_folder}"
  cargo test --frozen
}

package() {
  cd "${_git_folder}"
  install -Dm755 target/release/"${pkgname%-git}" -t "$pkgdir/usr/bin/"

  install -d "${pkgdir}/usr/lib/n2/bin"
  ln -s /usr/bin/n2 "${pkgdir}/usr/lib/n2/bin/ninja"
}
