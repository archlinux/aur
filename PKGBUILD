# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=1.0.3
pkgrel=1
pkgdesc="A program to retrieve the best and latest Pacman mirror list based on user's geography"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-mirrorup"
license=('GPL-3.0-or-later')
depends=()
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('a8963fcae5631d038ba4082c23187a978cda99cf386095832c48ee64a6a437c9fffd108f2a961d44a4f0ae09c86b7c3e186b3c899657710d00e67791208fb3db')

prepare() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 "target/release/pacman-mirrorup" "${pkgdir}/usr/bin/pacman-mirrorup"

  install -Dm644 "pacman-mirrorup.service" "${pkgdir}/usr/lib/systemd/system/pacman-mirrorup.service"
  install -Dm644 "pacman-mirrorup.timer" "${pkgdir}/usr/lib/systemd/system/pacman-mirrorup.timer"

  install -Dm644 "README.adoc" "${pkgdir}/usr/share/doc/${pkgname}/README.adoc"
}
