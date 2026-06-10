# Maintainer: Xyqra <xyqra@xyqra.ch>
pkgname=moltorino-git
pkgver=r2.911a2b4
pkgrel=1
pkgdesc="A fork of Chatterino7 with pinned messages, polls, predictions, and more"
arch=('x86_64')
url="https://codeberg.org/MoltoBenne/Moltorino"
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-imageformats'
    'boost-libs'
    'openssl'
    'libnotify'
    'hunspell'
)
makedepends=(
    'git'
    'cmake'
    'boost'
    'qt6-tools'
    'pkgconf'
)
optdepends=('qt6-wayland: Wayland support')
provides=('moltorino')
conflicts=('moltorino')
source=("$pkgname::git+https://codeberg.org/MoltoBenne/Moltorino.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive

    # Fix upstream build error: connect() returns void, can't be assigned to scoped_connection (no-op once fixed upstream)
    sed -i -E '/this->(transmitPresenceConnection_|activityHeartbeatConnection_|heartbeatAccountConnection_) =$/d' \
        src/providers/moltorino/MoltorinoPresence.cpp
}

build() {
    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_WITH_QTKEYCHAIN=OFF \
        -DCHATTERINO_SPELLCHECK=ON \
        -DSKIP_JSON_GENERATION=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
