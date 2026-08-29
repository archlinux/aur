# Maintainer: Locez <locez@locez.com>
pkgname=bilihud-git
_pkgname=bilihud
pkgver=0.7.0.r0.g0000000
pkgrel=1
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
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git"
        "git+https://github.com/xfgryujk/blivedm.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$_pkgname"
    local _ver
    _ver=$(python -c 'import tomllib; print(tomllib.load(open("pyproject.toml", "rb"))["project"]["version"])') || return 1
    
    printf "%s.r%s.g%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule init
    git config submodule.vendor/blivedm.url "$srcdir/blivedm"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation -Ccmake.define.BILIHUD_LAYER_SHELL=ON
}

package() {
    cd "$_pkgname"
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
