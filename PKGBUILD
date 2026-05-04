# Maintainer: futpib <futpib@gmail.com>

_pkgname=cdgcd
pkgname="${_pkgname}-git"
pkgver=r5.b86633a
pkgrel=1
pkgdesc="Allow-list garbage collector for systemd-coredump dumps"
arch=('x86_64')
url="https://github.com/futpib/cdgcd"
license=('GPL3')
depends=()
backup=('etc/cdgcd.toml')
makedepends=('rust' 'cargo' 'git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=('git+https://github.com/futpib/cdgcd.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}" "target/release/cdgcctl"
  install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/" "etc/${_pkgname}.service"
  install -Dm644 -t "${pkgdir}/etc" "etc/${_pkgname}.toml"
}
