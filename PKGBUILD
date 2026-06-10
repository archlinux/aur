# Maintainer: Tokyob0t <tokyob0t.business[at]proton.me>

_pkgname=fht-share-picker
pkgname="$_pkgname-git"
pkgver=25.10.0.r808.daa57e6
pkgrel=1
pkgdesc='A Wayland XDG screencast output picker'
groups=('fht-desktop')
arch=('x86_64')
url="https://github.com/nferhat/fht-compositor"
license=('GPL-3.0-or-later')
source=("git+${url}.git")
sha256sums=('SKIP')

makedepends=(
    'git'
    'cargo'
    'cairo'
    'pango'
    'graphene'
    'gdk-pixbuf2'
)

depends=(
    'gtk4'
    'glibc'
    'glib2'
    'gcc-libs'
    'libadwaita'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_srcpath="fht-compositor/fht-share-picker"

pkgver() {
    cd "$srcdir/$_srcpath"

    printf "%s.r%s.%s" \
        "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_srcpath"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_srcpath"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$_srcpath"

    install -Dm755 "target/release/$_pkgname" \
        "$pkgdir/usr/bin/$_pkgname"

    # install -Dm644 README.md \
    #     "$pkgdir/usr/share/doc/$pkgname/README.md"

    # install -Dm644 LICENSE \
    #     "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
