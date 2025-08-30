# Maintainer: Simon Repp <simon@fdpl.io>

arch=('x86_64')
# TODO: Dependency on openslide and poppler-glib is unclear,
#       technically these are optional dependencies of libvips
#       and faircamp does not require them either (no TIFF or SVG/PDF
#       related operations with libvips), but at least two people have
#       reported runtime errors related to libvips without them (for faircamp-git).
depends=('ffmpeg' 'libvips>=8.13.3' 'openslide' 'opus' 'poppler-glib')
license=('AGPL3')
makedepends=('cargo' 'cmake' 'git')
options=('!lto')
pkgdesc='A static site generator for audio producers'
pkgname=faircamp
pkgrel=1
pkgver=1.6.0
sha256sums=('c8d43e2618928de3935646fba4f85fa8d0dd23a5d11ea10f081fa430aa79d5b9')
url='https://simonrepp.com/faircamp'

source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/simonrepp/faircamp/archive/${pkgver}.tar.gz")

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

prepare() {
    # cargo fetch pulls in optional dependencies that are not used in build(),
    # and which therefore have differing toolchain minimum requirements,
    # therefore we specify nightly as toolchain here.
    # See also: https://github.com/rust-lang/cargo/issues/5704
    export RUSTUP_TOOLCHAIN=nightly
    cd "$srcdir/$pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}
