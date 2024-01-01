# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=1.0.0
pkgrel=1
pkgdesc="A program to retrieve the best and latest Pacman mirror list based on user's geography"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-mirrorup"
license=('GPL-3.0-or-later')
depends=()
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('a87053f10753fb56359a26fdb4ee95d5f3c1b4f868a81b94905c161e34e8032b7fee3ff3f27a78cad5935d9513e844c3b3594ab57636178b00f01ca1276defd0')

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
