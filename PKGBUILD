# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=system76-scheduler-niri
pkgname="$_pkgname-git"
pkgver=r2.gc950aac
pkgrel=1
pkgdesc="Niri integration for system76-scheduler"
arch=("x86_64")
url="https://github.com/Kirottu/system76-scheduler-niri"
license=("Custom:NONE")
makedepends=(cargo git)
conflicts=("$_pkgname")
source=(
  "git+$url.git"
)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "${srcdir}/${_pkgname}" || exit
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release --all-features
}

package() {
  cd "${srcdir}/${_pkgname}" || exit
  install -Dm0755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
}
