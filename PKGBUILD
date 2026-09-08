# Maintainer: willker <wz[dot]willker[at]gmail[dot]com>
# Contributor: Locez <locez@locez.com>

pkgname=bilihud
pkgver=0.7.1
pkgrel=2
pkgdesc="B站弹幕阅读器 - 一个可以在游戏全屏时显示弹幕，且支持开播的Qt应用程序"
arch=('x86_64')
url="https://github.com/locez/bilihud"
license=('MIT')
keywords=('bilibili' 'danmaku' 'danmu' 'danmuji' 'danmuplayer' 'linux' 'livestreaming' 'macos' 'windows')
depends=(
    'python>=3.13'
    'python-pyqt6'
    'python-aiohttp'
    'python-qasync'
    'python-brotli'
    'python-pure-protobuf' # AUR
    'python-qrcode'
    'python-keyring'
    'python-pillow'
    'qt6-base'
    'qt6-multimedia'
    'qt6-svg'
    'qt6-wayland'
    'layer-shell-qt'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-scikit-build-core'
    'cmake'
    'ninja'
    'gcc'
    'pkgconf'
)
source=("git+$url.git#tag=v$pkgver"
        "git+https://github.com/xfgryujk/blivedm.git")
sha256sums=('fa57098568b067af2ee2af022d7ecab72950bed63d8b9c1d92beb8c5038b13e2'
            'SKIP')

prepare() {
    cd "$pkgname"
    git submodule init
    git config submodule.vendor/blivedm.url "$srcdir/blivedm"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$pkgname"
    python -m build --wheel --no-isolation -Ccmake.define.BILIHUD_LAYER_SHELL=ON
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl

    local _bridge
    _bridge=$(find "$pkgdir" -type f -name 'libbili-layer.so' -print -quit)
    if [[ -z "$_bridge" ]]; then
        error "Layer Shell bridge was not installed"
        return 1
    fi

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
