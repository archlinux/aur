# Maintainer: Bhanupong Petchlert <bpetlert@gmail.com>
pkgname=pacman-mirrorup
pkgver=1.0.4
pkgrel=1
pkgdesc="A program to retrieve the best and latest Pacman mirror list based on user's geography"
arch=('x86_64')
url="https://github.com/bpetlert/pacman-mirrorup"
license=('GPL-3.0-or-later')
depends=()
makedepends=(cargo)
options=(!lto)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bpetlert/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('5b8578538508368fd72c41b7ded19c06705826b024c0c53faa3337f8b42f071e0b2275b608c03e87908ed0f8b5c439f2bf3be4e1e8e664be0917aad770998ee9')

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
