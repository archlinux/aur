# Maintainer: Nathaniel van Diepen <eeems@eeems.email>
pkgname=retibbs-client-git
pkgver=r76.7c26d2c
pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
pkgrel=1
url=https://github.com/kc1awv/RetiBBS
pkgdesc="BBS over Reticulum TUI client"
arch=(any)
source=(
    "$pkgname::git+https://github.com/kc1awv/RetiBBS.git#branch=main"
    "retibbs-client"
)
sha256sums=(
    SKIP
    SKIP
)
license=(MIT)
provides=("retibbs-client")
conflicts=("retibbs-client")
depends=(
    python-rns
    python-lxmf
    python-textual
    python-rich
    bash
)
makedepends=(
    nuitka
    git
    scons
)
build() {
    set -e
    cd "$srcdir"/"$pkgname"/client
    nuitka --mode=accelerated \
        --include-module=modals \
        --include-module=announce_handler \
        retibbs_textual.py

}
package() {
    set -e
    install -Dm644 "$srcdir"/"$pkgname"/client/app.tcss "$pkgdir"/usr/share/retibbs/app.tcss
    install -Dm755 "$srcdir"/"$pkgname"/client/retibbs_textual.bin "$pkgdir"/usr/share/retibbs
    install -Dm755 "$srcdir"/retibbs-client "$pkgdir"/usr/bin/retibbs-client
}
