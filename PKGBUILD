# Maintainer: Ethan Stokes <erstokes10@gmail.com>

pkgname=blockwork
pkgver=0.6.1
pkgrel=1
pkgdesc='A Qt 6/QML app to visually create and run automation.'
url='https://github.com/Blockworked/blockwork'
arch=('x86_64')
license=('GPL-3.0-only')
makedepends=('cargo' 'git' 'pkgconf')
depends=(
    'qt6-base' 'qt6-declarative' 'gtk3' 'hicolor-icon-theme'
    'libgcc' 'glibc'
)
conflicts=('blockwork-git' 'macros')
provides=('macros')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Blockworked/blockwork/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('26b3a61bacbc877c3cd15ec28ad276b9d87e1206fb56a081a00d595d7d0a5358')
options=('!lto')

prepare() {
    cd "Blockwork-$pkgver"

    cargo fetch
}

build() {
    cd "Blockwork-$pkgver"

    cargo build --release --frozen --workspace --exclude blockwork-linux-bridge
}

package() {
    cd "Blockwork-$pkgver"

    local libdir="$pkgdir/usr/lib/blockwork"

    install -Dm755 "target/release/blockwork"        "$libdir/blockwork"
    install -Dm755 "target/release/blockwork-daemon" "$libdir/blockwork-daemon"

    install -d "$pkgdir/usr/bin"
    ln -sf /usr/lib/blockwork/blockwork "$pkgdir/usr/bin/blockwork"

    install -Dm644 "res/icons/blockwork.png" "$pkgdir"/usr/share/icons/hicolor/512x512/apps/blockwork.png
    install -Dm644 "res/blockwork.desktop" "$pkgdir"/usr/share/applications/com.blockworked.Blockwork.desktop
}
