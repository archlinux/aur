# Maintainer: futpib <futpib@gmail.com>

_pkgname=choomd
pkgname="${_pkgname}-git"
pkgver=1.0.0.r0.gbd01a50
pkgrel=1
pkgdesc="Adjust process OOM-killer scores based on process names and other attributes"
arch=('x86_64')
url="https://github.com/futpib/choomd"
license=('GPL3')
depends=()
backup=('etc/choomd.toml')
makedepends=('rust' 'cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/futpib/choomd.git')
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
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "etc/choomd.service"
  install -Dm644 -t "${pkgdir}/etc" "etc/choomd.toml"
}
