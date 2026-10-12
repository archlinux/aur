# Maintainer: Notify Ctrl <notify-ctrl@qq.com>
pkgname=ktabletop-git
_pkgname=ktabletop
pkgver=r1.0000000
pkgrel=1
pkgdesc="A boardgame platform based on Qt/QML and KDE Frameworks, using Lua for scripting"
arch=('x86_64' 'aarch64')
url="https://invent.kde.org/notifyctrl/ktabletop"
license=('LGPL-2.1-or-later')
depends=(
    'lua55'
    'libgit2'
    'openssl'
    'spdlog'
    'qt6-base'
    'qt6-declarative'
    'kirigami'
    'kirigami-addons'
    'kcoreaddons'
    'kconfig'
    'ki18n'
    'kcolorscheme'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
    'extra-cmake-modules'
)
provides=("${pkgname%-git}=${pkgver}")
conflicts=("${pkgname%-git}")
source=("${_pkgname}::git+https://invent.kde.org/notifyctrl/ktabletop.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
        git describe --long --abbrev=7 2>/dev/null \
            | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" \
            "$(git rev-parse --short=7 HEAD)"
    )
}

build() {
    cmake -B build -S "$_pkgname" \
        -DBUILD_TESTING=OFF \
        -DCMAKE_BUILD_TYPE=MinSizeRel \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build -j
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
