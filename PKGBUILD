# Maintainer: futpib <futpib@gmail.com>

_pkgname=divoom-ditoo-pro-controller
pkgname="${_pkgname}-git"
pkgver=0.1.0.r0.g9b6a9db
pkgrel=1
pkgdesc="Divoom Ditoo Pro controller"
arch=('x86_64')
url="https://github.com/futpib/divoom-ditoo-pro-controller"
license=('MIT')
depends=('dbus' 'fontconfig' 'bluez')
optdepends=('bdf-creep: good dot matrix font')
makedepends=('rust' 'cargo' 'git' 'pkg-config')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/futpib/divoom-ditoo-pro-controller.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
}
