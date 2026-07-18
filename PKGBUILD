# Maintainer: Locez <locez@locez.com>
pkgname=bilihud
pkgver=0.5.1
pkgrel=1
pkgdesc="B站弹幕阅读器 - 一个可以在游戏全屏时显示弹幕的Qt应用程序"
arch=('any')
url="https://github.com/locez/bilihud"
license=('MIT')
depends=(
    'python>=3.10'
    'python-pyqt6'
    'python-aiohttp'
    'python-qasync'
    'python-brotli'
    'python-browser-cookie3' # AUR
    'python-pure-protobuf' # AUR
    'python-qrcode'
    'python-keyring'
    'python-pillow'
    'qt6-base'
    'qt6-wayland'
    'layer-shell-qt'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-hatch-build-scripts' # Needed for custom build hook
    'python-wheel'
)
source=("git+$url.git#tag=v$pkgver"
        "git+https://github.com/xfgryujk/blivedm.git")
sha256sums=('9ed09913fb9b61de9f91d79622a04eed7894c6aa386aaf7552111115bbf44d39'
            'SKIP')

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.vendor/blivedm.url "$srcdir/blivedm"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    # Install desktop entry and icon if available
    if [ -f bilihud.desktop ]; then
        install -Dm644 bilihud.desktop "$pkgdir/usr/share/applications/bilihud.desktop"
    fi
    
    # Install icon
    if [ -f src/bilihud/assets/icon.png ]; then
        install -Dm644 src/bilihud/assets/icon.png "$pkgdir/usr/share/pixmaps/bilihud.png"
    fi

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
