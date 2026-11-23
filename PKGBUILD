# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=exabind-git
pkgver=r101.781be73
pkgrel=1
pkgdesc="Animated TUI for viewing KDE shortcuts"
arch=('x86_64' 'aarch64')
url="https://github.com/junkdog/exabind"
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release -p exabind
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/exabind" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
