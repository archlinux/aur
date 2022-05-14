# Maintainer: devvick <root@devvick.eu>

pkgname=zeronsd-git
pkgver=r452.856a30c
pkgrel=1
pkgdesc="Unicast DNS resolver for ZeroTier networks"
url="https://github.com/zerotier/zeronsd"
license=("BSD-3-Clause")
arch=("any")
depends=("zerotier-one")
makedepends=("rustup" "git")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" "${pkgname/-git/-bin}")
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --locked --all-features
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --release --locked --lib
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  _output="${srcdir}/${pkgname%-git}"
  install -Dm755 target/release/${pkgname%-git} -t "${pkgdir}/usr/bin"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
