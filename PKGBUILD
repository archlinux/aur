# Maintainer: Frigyes Erdosi-Szucs <eszfrigyes06 at gmail dot com>
pkgname=universal-android-debloater-git
pkgver=1.0.3.r100.g0dbd9f9
pkgrel=1
epoch=
pkgdesc="A cross-platform GUI debloater for android devices"
arch=('x86_64')
url="https://github.com/Universal-Debloater-Alliance/universal-android-debloater-next-generation.git"
license=('GPL-3.0-or-later')
groups=()
depends=('android-tools' 'gcc-libs')
makedepends=('git' 'cargo' 'clang' 'cmake' 'mold')
checkdepends=()
optdepends=()
provides=(universal-android-debloater-git)
conflicts=('universal-android-debloater-opengl'
        'universal-android-debloater-opengl-bin'
        'universal-android-debloater'
        'universal-android-debloater-bin')
replaces=()
backup=()
changelog=
source=("git+$url#branch=main")
noextract=()
md5sums=('SKIP')
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd $srcdir/universal-android-debloater-next-generation
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $srcdir/universal-android-debloater-next-generation
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd $srcdir/universal-android-debloater-next-generation
    export CARGO_HOME="$srcdir/cargo-home"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    CFLAGS+=" -ffat-lto-objects"
    cargo build --frozen --release --no-default-features --features wgpu,no-self-update
}

package() {
    cd $srcdir/universal-android-debloater-next-generation
    install -Dm755 target/release/uad-ng -t "$pkgdir/usr/bin/"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

