pkgname=openmeters-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Fast and professional audio metering/visualization for Linux."
arch=("x86_64")
url="https://github.com/httpsworldview/openmeters"
license=("GPL-3.0-or-later")
depends=("pipewire" "wayland" "libxkbcommon" "vulkan-icd-loader")
makedepends=("git" "cargo" "pkgconf" "pipewire" "clang")
provides=("openmeters")
conflicts=("openmeters")
source=("git+https://github.com/httpsworldview/openmeters.git")
sha256sums=("SKIP")
options=('!lto' '!debug')

pkgver() {
    cd "$srcdir/openmeters"
    echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/openmeters"
    cargo build --locked --release
}

package() {
    cd "$srcdir/openmeters"
    install -Dm755 target/release/openmeters "$pkgdir/usr/bin/openmeters"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 misc/openmeters.desktop "$pkgdir/usr/share/applications/openmeters.desktop"
    install -Dm644 misc/openmeters.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/openmeters.png"
}
