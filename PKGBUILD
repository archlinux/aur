# Maintainer: fredrir
pkgname=fredulator-git
_pkgname=fredulator
pkgver=r0.0000000
pkgrel=1
pkgdesc='GTK calculator with vim motions, multi-tab support, and Elm-style architecture'
arch=('x86_64' 'aarch64')
url='https://github.com/fredrir/fredulator'
license=('MIT')
depends=('gtk3')
makedepends=('cargo' 'rust' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --frozen --release
}

check() {
    cd "$srcdir/$_pkgname"
    cargo test --frozen --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
    install -Dm644 "$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
