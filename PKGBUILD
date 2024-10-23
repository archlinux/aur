# Maintainer: tam1m <tbacc plus aur at pm dot me>
pkgname=sonusmix-git
_pkgname=sonusmix
pkgver=r185.66e5ca1
pkgrel=2
pkgdesc="Next-gen Pipewire audio routing tool"
arch=('x86_64')
url="https://codeberg.org/sonusmix/sonusmix"
license=('MPL-2.0')
depends=('pipewire' 'gtk4')
makedepends=('clang' 'cargo' 'git')
source=("git+https://codeberg.org/sonusmix/sonusmix" "sonusmix.desktop") # Add the patch file to the source
sha256sums=('SKIP'
    'cf3059786a8e6d62f72979954ef6e9730575ec3d2ec1dcd5ddae78f043765f9a')
conflicts=('sonusmix')

pkgver() {
    cd "$_pkgname"
    (
        set -o pipefail
        git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$srcdir/$_pkgname"

}

build() {
    cd "$srcdir/$_pkgname"
    export CARGO_TARGET_DIR=target
    cargo build --release --all-features
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/usr/share/icons"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/licenses/${_pkgname}"

    install -Dm755 "$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$_pkgname/assets/sonusmix.svg" "$pkgdir/usr/share/icons/"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/"
    install -Dm644 "$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/${_pkgname}/"
}
