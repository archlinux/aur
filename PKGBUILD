# Maintainer: Rin <icealtria at gmail dot com>

pkgbase=geph5-git
_pkgbase=geph5
pkgname=(
         #'geph5-bridge-git'
         #'geph5-broker-git'
         'geph5-client-git'
         'geph5-app-git'
         #'geph5-exit-git'
         )
pkgver=r1799.189d5df
pkgrel=1
pkgdesc="Geph is a modular Internet censorship circumvention system designed specifically to deal with national filtering."
arch=('x86_64')
url="https://github.com/geph-official/geph5"
license=('MPL-2.0')
depends=('gcc-libs' 'glibc')
makedepends=('git' 'cargo')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}"/"${_pkgbase}"/
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export RUSTUP_TOOLCHAIN=stable
  cd "${srcdir}"/"${_pkgbase}"/
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export CFLAGS+=" -ffat-lto-objects" # https://github.com/launchbadge/sqlx/issues/3149
  cd "${srcdir}"/"${_pkgbase}"/
  cargo build --frozen --release --manifest-path binaries/geph5-client/Cargo.toml
  cargo build --frozen --release --manifest-path binaries/geph5-app/Cargo.toml
}

package_geph5-client-git() {
  cd "${srcdir}"/"${_pkgbase}"/
  provides=('geph5-client')
  conflicts=('geph5-client' 'gephgui-wry-bin')
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/geph5-client"
}

package_geph5-app-git() {
  provides=('geph5')
  conflicts=('gephgui-wry-bin' 'geph5')
  cd "${srcdir}/${_pkgbase}/"
  install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/geph5"
}
