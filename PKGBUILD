# Maintainer: John Bernard <loqusion@gmail.com>
_pkgname=hyprshade
pkgname=${_pkgname}-rewrite-git
pkgver=0.1.0
pkgrel=1
pkgdesc="(WIP rewrite) Hyprland shader configuration tool"
arch=('x86_64')
url="https://github.com/loqusion/${_pkgname}-rewrite"
license=('MIT')
depends=('hyprland')
makedepends=('git' 'cargo')
# WARN: This package is intended for testing purposes only.
# It should not be shown to users trying to install hyprshade.
# provides=("$_pkgname")
conflicts=("$_pkgname")
install="${_pkgname}.install"
source=("${_pkgname}::git+https://github.com/loqusion/${_pkgname}-rewrite.git")
sha512sums=('SKIP')

prepare() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable

    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_pkgname"

    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release
}

package() {
    cd "$_pkgname"

    install -Dm755 "target/release/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"

    install -Dm644 "shaders"/* -t "$pkgdir/usr/share/${_pkgname}/shaders/"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
