# Maintainer: zebdo <zebdo at posteo dot ee>

pkgname=ktile-git
pkgver=0.1.1.r109.3512368
pkgrel=1
pkgdesc='Custom window snap regions for KDE Plasma (KWin script + KCM) - git version'
arch=('x86_64')
url='https://github.com/51n7/kTile'
license=('GPL-2.0-or-later')

depends=(
    'kwin'
    'plasma-workspace'
    'kcmutils'
    'kirigami'
    'kdeclarative'
)

makedepends=(
    'git'
    'cmake'
    'extra-cmake-modules'
    'qt6-base'
    'qt6-declarative'
    'kconfig'
    'kcoreaddons'
    'ki18n'
)

provides=('ktile')
conflicts=('ktile')
options=('!debug')

source=('ktile::git+https://github.com/51n7/kTile.git')
sha256sums=('SKIP')

pkgver() {
    cd ktile

    local _version
    _version="$(
        sed -n \
            's/^project(kTile VERSION \([0-9][0-9.]*\) LANGUAGES CXX)/\1/p' \
            CMakeLists.txt
    )"

    printf '%s.r%s.%s' \
        "$_version" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd ktile

    cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

    cmake --build build
}

package() {
    cd ktile

    DESTDIR="$pkgdir" cmake --install build
}
