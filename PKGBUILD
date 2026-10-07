# Maintainer: Xyqra <xyqra@xyqra.ch>
pkgname=moltorino-git
pkgver=r6041.810bba4b0
pkgrel=1
pkgdesc="A fork of Chatterino7 with pinned messages, polls, predictions, and more"
arch=('x86_64')
url="https://github.com/EEVA-inc/Moltorino7"
license=('GPL-3.0-or-later')
depends=(
    'qt6-base'
    'qt6-svg'
    'qt6-imageformats'
    'qt6-5compat'
    'boost-libs'
    'openssl'
    'libnotify'
    'libsecret'
    'hunspell'
    'webkit2gtk-4.1'
    'json-glib'
    'ffmpeg'
)
makedepends=(
    'git'
    'cmake'
    'boost'
    'qt6-tools'
    'pkgconf'
    'rapidjson'
    'libwebm'
)
optdepends=('qt6-wayland: Wayland support')
provides=('moltorino')
conflicts=('moltorino')
source=("$pkgname::git+https://github.com/EEVA-inc/Moltorino7.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive

    # Workaround for old upstream build error, harmless if already fixed
    sed -i -E '/this->(transmitPresenceConnection_|activityHeartbeatConnection_|heartbeatAccountConnection_) =$/d' \
        src/providers/moltorino/MoltorinoPresence.cpp
}

build() {
    # Upstream expects a bundled media tools dir; point it at system ffmpeg
    local media="$srcdir/media-tools"
    mkdir -p "$media/licenses"
    ln -sf /usr/bin/ffmpeg "$media/ffmpeg"
    ln -sf /usr/bin/ffprobe "$media/ffprobe"
    cp -r /usr/share/licenses/ffmpeg/. "$media/licenses/" 2>/dev/null || true

    cmake -B build -S "$pkgname" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_WITH_QTKEYCHAIN=OFF \
        -DCHATTERINO_SPELLCHECK=ON \
        -DSKIP_JSON_GENERATION=ON \
        -DMOLTORINO_MEDIA_TOOLS_DIR="$media" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -Wno-error=uninitialized"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
