# Maintainer: Bart Libert <bart plus aur at libert dot email>
_pkgname=niri-autoname-workspaces
pkgname=${_pkgname}-git
pkgver=r16.8957eda
pkgrel=1
pkgdesc="Show icons for running programs in the niri window manager"
arch=(x86_64)
url="https://github.com/justbuchanan/niri-autoname-workspaces"
license=('MIT')
depends=('niri' 'ttf-font-nerd' 'glibc' 'gcc-libs')
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
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${_pkgname}"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
