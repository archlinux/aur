# Maintainer: hanchain <85230240+HanchaiN@users.noreply.github.com>

_pkgname='lyrical'
pkgname="${_pkgname}-git"
pkgver=0.4.4.47.g25f3723
pkgrel=1
pkgdesc='A rust tool to display synced lyrics in your waybar (or any other bar)!'
arch=('x86_64')
url='https://github.com/tblelrd/lyrical'
license=('GPL-3.0-or-later')
depends=('openssl' 'glibc' 'playerctl')
makedepends=('git' 'cargo')
provides=('lyrical')
conflicts=('lyrical')
_pkgsrc="${pkgname}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target host-tuple
}

pkgver() {
  cd "${_pkgsrc}"
  (
    set -o pipefail
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "${_pkgsrc}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd "${_pkgsrc}"

  install -Dm755 -t "${pkgdir}/usr/bin/" "target/release/${_pkgname}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE' 
}
