# Maintainer: swweetp <swweetp@outlook.com>
# Contributor: Amirul Fitri <tounghacker@gmail.com>

pkgname=playit
pkgver=0.16.2
pkgrel=1
pkgdesc="A tunneling tool to host a game server without port forwarding or sharing public IP"
arch=('x86_64')
url="https://playit.gg"
depends=('glibc' 'gcc-libs')
license=('BSD-2-Clause')
makedepends=('cargo')
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/playit-cloud/playit-agent/archive/refs/tags/v${pkgver}.tar.gz"
  "systemd-service.patch"
  "tmpfiles.conf"
)
sha256sums=('3db7cd4b569b502bf0f725a545e6acb3344439cea11c04d202742d7680f82a15'
            '27e70d8498049ab785e04076e4e0b8fea7ddb9639ad3bbef93241cc96adb6ad8'
            '91c4f8c54d07f5877de216263e586ac96a6cf33e29219f1436e8447adb62cf9d')
options=(!lto)

prepare() {
  cd "playit-agent-${pkgver}"
  patch -Np1 -i ../systemd-service.patch
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
  cd "playit-agent-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

check() {
  cd "playit-agent-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --all-features
}

package() {
  cd "playit-agent-${pkgver}"
  install -Dm755 target/release/playit-cli "${pkgdir}"/usr/bin/"${pkgname}"
  install -Dm644 linux/playit.service "${pkgdir}"/usr/lib/systemd/system/playit.service
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 linux/logrotate.conf "${pkgdir}"/etc/logrotate.d/playit
  install -Dm644 ../tmpfiles.conf "${pkgdir}"/usr/lib/tmpfiles.d/playit.conf
}
