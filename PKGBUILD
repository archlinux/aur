# Maintainer: wysbd <aur@wysbd.dev>

pkgname="hyprland-preview-share-picker-git"
pkgver=0.2.0.r5.g111fd70
pkgrel=1
pkgdesc="An alternative share picker for hyprland with window and monitor previews"
arch=(x86_64)
url="https://github.com/WhySoBad/hyprland-preview-share-picker"
license=(MIT)
depends=('gtk4' 'gtk4-layer-shell' 'xdg-desktop-portal-hyprland' 'hyprland')
makedepends=(cargo)
optdepends=(
  'slurp: default tool for selecting share regions'
)
source=("$pkgname::git+https://github.com/WhySoBad/hyprland-preview-share-picker")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --abbrev=7 --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.subprojects/lib.url "$srcdir/lib"
    git -c protocol.file.allow=always submodule update

    export RUSTUP_TOOLCHAIN=nightly
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname"

    export RUSTUP_TOOLCHAIN=nightly
    export CARGO_TARGET_DIR=target

    cargo build --frozen --release

    ./target/release/hyprland-preview-share-picker schema > schema.json
}

package() {
    cd "$pkgname"

    install -Dm0755 -T "target/release/hyprland-preview-share-picker" "$pkgdir/usr/bin/hyprland-preview-share-picker"

    install -dm0755 "$pkgdir/usr/share/hyprland-preview-share-picker"
    install -Dm0644 "schema.json" "$pkgdir/usr/share/hyprland-preview-share-picker"
}
