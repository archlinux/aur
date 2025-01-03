# Maintainer: VitalyR <vr@vitalyr.com>
# Contributor: Meow King <mr.ziqiyang@gmail.com>

_pkgname=emacs-lsp-booster
pkgname=emacs-lsp-booster-git
pkgver=r53.59f42ab # NOTE
pkgrel=1           # NOTE
pkgdesc="Emacs LSP performance booster "
arch=("x86_64")
url="https://github.com/blahgeek/emacs-lsp-booster"
license=('MIT')
depends=()
makedepends=('cargo')
conflicts=($_pkgname)
changelog="changelog.txt" # NOTE
source=("git+https://github.com/blahgeek/emacs-lsp-booster")
sha256sums=('SKIP')

_srcenv() {
    export CARGO_TARGET_DIR=target
    CFLAGS+=' -ffat-lto-objects'
    CXXFLAGS+=' -ffat-lto-objects'
    RUSTFLAGS=' -C target-cpu=native -C lto=true -C embed-bitcode=yes -Zdylib-lto '
    RUSTFLAGS+=" --remap-path-prefix $PWD=/"
}

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    _srcenv
    cd "$srcdir/$_pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 target/release/emacs-lsp-booster "${pkgdir}/usr/bin/$_pkgname"
}
