# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=sensor-vision-git
pkgver=r29.a4dd0de
pkgrel=1
pkgdesc="TUI Client for TeamViewer IoT MQTT API for managing IoT Sensors"
arch=('x86_64' 'aarch64')
url="https://github.com/jcfromsiberia/sensor-vision"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
makedepends=('cargo' 'git' 'cmake')
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
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  export CFLAGS+=" -std=gnu17"
  cargo build --frozen --release
}

check() {
  cd "${pkgname%-git}"
  export RUSTUP_TOOLCHAIN=stable
  export PKG_CONFIG_PATH=/usr/lib/openssl-3/pkgconfig
  export CMAKE_POLICY_VERSION_MINIMUM=3.5
  export CFLAGS+=" -std=gnu17"
  cargo test --frozen
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "target/release/sensor-vision" -t "${pkgdir}/usr/bin"
  install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
