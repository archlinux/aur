# Maintainer: Megaguy32 <your-email@example.com>
pkgname=lem-editor-webview-ncurses-nightly
pkgrel=1
pkgver=2.3.0.478.g803e4922
pkgdesc="An extensible editor written in Common Lisp"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/lem-project/lem"
license=('MIT')
options=("!strip")
depends=('ncurses' 'webkitgtk-6.0')
makedepends=('git' 'sbcl' 'qlot')
conflicts=('lem-editor')
provides=('lem-editor')
source=("lem::git+$url#tag=nightly-latest")
sha256sums=('SKIP')
_variant="webview-ncurses"

pkgver() {
    cd "$srcdir/lem"
    git describe --tags --match "v*" | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/lem"
    export LD_LIBRARY_PATH="$srcdir/lem/extensions/terminal/lib/linux/x64"
    make terminal-lib LISP="sbcl --non-interactive"
    make ${_variant}
}

package() {
    cd "$srcdir/lem"
    install -Dm755 lem "$pkgdir/usr/bin/lem"
    install -Dm755 extensions/terminal/lib/linux/x64/terminal.so \
        "$pkgdir/usr/lib/terminal.so"
    install -Dm644 scripts/install/lem.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/lem.svg"
    install -Dm644 resources/lem.png \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/lem.png"
    install -Dm644 resources/lem.desktop \
        "$pkgdir/usr/share/applications/lem.desktop"
}
