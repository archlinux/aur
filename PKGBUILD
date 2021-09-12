# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=nvui
pkgver=0.1.2
pkgrel=2
pkgdesc='A modern frontend for Neovim'
arch=('x86_64')
url='https://github.com/rohit-px2/nvui'
license=('MIT')
depends=(
    'boost'
    'fmt'
    'msgpack-c'
    'qt5-base'
    'qt5-svg'
    'hicolor-icon-theme'
)
makedepends=(
    'cmake'
    'ninja'
    'catch2'
)
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/rohit-px2/nvui/archive/refs/tags/v$pkgver.tar.gz"
    nvui.desktop
    nvui.sh
)
sha256sums=('d86c5719f04bc8f28e76a85ef53f15d2d824a1eddb07be432f3ee057cc40639b'
            '529e087f9ea5d212c05e1cfd7da51f5e5718acc186a1925f937707c641ebd509'
            '987f46b07c32efbb5f1ef4783204d15b6d8be32833cb7732d4752eb4fb5b9a08')

build() {
    cd "$pkgname-$pkgver"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=Release -G Ninja
    cmake --build build --target nvui --config Release
}

package() {
    # https://github.com/rohit-px2/nvui/blob/main/BUILDING.md#packaging-executable
    install -Dm755 nvui.sh "$pkgdir/usr/bin/$pkgname"
    install -Dm644 nvui.desktop -t "$pkgdir/usr/share/applications"
    cd "$pkgname-$pkgver"
    find assets vim -type f -exec install -Dm 644 "{}" "${pkgdir}/opt/$pkgname/{}" \;
    install -Dm755 build/nvui -t "$pkgdir/opt/$pkgname/bin"
    install -Dm644 assets/appicon.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
