# Maintainer: Maik-0000FF <maik-0000ff.aur@web.de>

pkgname=fcitx5-schnelle-umlaute-git
_pkgname=fcitx5-schnelle-umlaute
pkgver=1.2.2.r448.g10855d7
pkgrel=1
pkgdesc="Quick Accent equivalent for Linux/Fcitx5 — map any Unicode character"
arch=('x86_64' 'aarch64')
url="https://github.com/Maik-0000FF/schnelle-umlaute"
license=('GPL-3.0-or-later')
depends=(
    'fcitx5'
    'qt6-base'
    'qt6-declarative'
    'layer-shell-qt'
    'libxkbcommon'
    'hicolor-icon-theme'
)
makedepends=(
    'git'
    'cmake'
    'extra-cmake-modules'
    'gettext'
)
optdepends=(
    'fcitx5-configtool: GUI configuration via system settings'
    'rebuild-detector: detects SONAME breakage after fcitx5 updates'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$pkgname.install"
source=("$_pkgname::git+$url.git#branch=dev")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    local _cmake_ver
    _cmake_ver=$(sed -nE 's/.*project\([^)]*VERSION ([0-9]+\.[0-9]+\.[0-9]+).*/\1/p' addon/CMakeLists.txt | head -1)
    printf '%s.r%s.g%s' \
        "${_cmake_ver:-0.0.0}" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname/addon"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$srcdir/$_pkgname/addon"
    DESTDIR="$pkgdir" cmake --install build
}
