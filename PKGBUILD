# Maintainer: Simon Repp <simon@fdpl.io>

pkgname=faircamp-git
pkgver=r529.369d9c6
pkgrel=1
pkgdesc='A static site generator for audio producers'
arch=('x86_64')
license=('AGPL3')
# TODO: Dependency on openslide and poppler-glib is unclear,
#       technically these are optional dependencies of libvips
#       and faircamp does not require them either (no TIFF or SVG/PDF
#       related operations with libvips), but at least two people have
#       reported runtime errors related to libvips without them.
depends=('ffmpeg' 'libvips>=8.13.3' 'openslide' 'opus' 'poppler-glib')
makedepends=('cargo' 'cmake' 'git')
url='https://simonrepp.com/faircamp'
conflicts=('faircamp')
provides=('faircamp')
options=('!lto')
source=('faircamp-git::git+https://codeberg.org/simonrepp/faircamp.git')
md5sums=('SKIP')

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "$srcdir/$pkgname"
    cargo build --features libvips --locked --offline --release
}

package() {
    mkdir -p "$pkgdir/usr/bin"
    install -Dm755 "$srcdir/$pkgname/target/release/faircamp" "$pkgdir/usr/bin/faircamp"
}

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    # cargo fetch pulls in optional dependencies that are not used in build(),
    # and which therefore have differing toolchain minimum requirements,
    # therefore we specify nightly as toolchain here.
    # See also: https://github.com/rust-lang/cargo/issues/5704
    export RUSTUP_TOOLCHAIN=nightly
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

