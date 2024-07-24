# Maintainer: John Bernard <loqusion@gmail.com>
_pkgname=hyprshade
pkgname=${_pkgname}-rewrite-git
pkgver=r703.87f984e
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

pkgver() {
	cd "$_pkgname"
	{
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
			printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	}
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

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
