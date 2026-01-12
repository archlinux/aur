# Maintainer: Kainoa Kanter <kainoa@t1c.dev>

_pkgname=system76-scheduler-niri
pkgname="$_pkgname-git"
pkgver=r2.gc950aac
pkgrel=2
pkgdesc="Niri integration for system76-scheduler"
arch=("x86_64")
url="https://github.com/Kirottu/system76-scheduler-niri"
license=("Custom:NONE")
makedepends=(cargo git)
conflicts=("$_pkgname")
source=(
  "git+$url.git"
  "fix-niri-latest.patch"
)
sha256sums=('SKIP'
            '57706686333c43b1cbf280c3430912386e8e46b2c91c3bb7d8d644275763a53a')

pkgver() {
    cd "${srcdir}/${_pkgname}" || exit
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgname}" || exit
  patch -p1 < "${srcdir}/fix-niri-latest.patch"
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
