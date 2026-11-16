# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=eckly
pkgname=${_pkgname}-git
pkgver=r19.448efcf
pkgrel=1
pkgdesc="TUI client for Readeck"
arch=(x86_64)
url="https://github.com/gollyhatch/eckly"
license=('GPL-3.0-or-later')
depends=()
makedepends=(cargo git)
provides=(${_pkgname})
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${_pkgname}"
    install -Dm755 "target/release/eckly" "$pkgdir/usr/bin/eckly"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
