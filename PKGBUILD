# Maintainer: Locez <locez@locez.com>
pkgname=bilihud-git
_pkgname=bilihud
pkgver=0.2.0.r0.gIT_REV_Here
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
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+$url.git"
        "git+https://github.com/xfgryujk/blivedm.git")
sha256sums=('SKIP' 'SKIP')

pkgver() {
    cd "$_pkgname"
    # Extract version from pyproject.toml
    local _ver
    _ver=$(grep -m1 'version =' pyproject.toml | cut -d '"' -f2)
    # If fails, default to 0.0.0
    if [ -z "$_ver" ]; then _ver=0.0.0; fi
    
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
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
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
