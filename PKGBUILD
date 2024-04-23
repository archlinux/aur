# Maintainer: anakojm <https://anakojm.net/about.html>

pkgname=sway-easyfocus-git
_pkgname="${pkgname%-git}"
pkgver=r42.2bef3f5
pkgrel=1
pkgdesc='A tool to help efficiently focus windows in Sway inspired by i3-easyfocus.'
arch=('any')
url="https://github.com/edzdez/$_pkgname"
license=('MIT')
depends=('gtk3' 'gtk-layer-shell')
makedepends=('git' 'cargo')
provides=("$_pkgname")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
        cd "$_pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
        cd "$_pkgname"
        export RUSTUP_TOOLCHAIN=stable
        cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
        cd "$_pkgname"
        export RUSTUP_TOOLCHAIN=stable
        export CARGO_TARGET_DIR=target
        cargo build --frozen --release --all-features
}

package() {
        cd "$_pkgname"
        install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
        install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
