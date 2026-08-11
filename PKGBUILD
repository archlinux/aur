# Maintainer: awaae001 <awaae001 at qq dot com>

pkgname=audacious-discord-rpc-git
pkgver=2.4.r1.g84a5f8e
pkgrel=2
pkgdesc='Discord Rich Presence plugin for Audacious (git version)'
arch=('x86_64')
url='https://github.com/onegen-dev/audacious-discord-rpc'
license=('MIT')
depends=(
    'audacious'
    'curl'
    'fmt'
    'glibc'
    'libgcc'
    'libstdc++'
)
makedepends=(
    'cmake'
    'git'
)
provides=('audacious-discord-rpc')
conflicts=('audacious-discord-rpc')
_discord_presence_commit=3b50b0854ec24f9b2d4cc8e28f9145f276bb998e
source=(
    "${pkgname%-git}::git+${url}.git"
    'glaze-7.8.1.tar.gz::https://github.com/stephenberry/glaze/archive/refs/tags/v7.8.1.tar.gz'
    "discord-presence-${_discord_presence_commit}.tar.gz::https://github.com/onegen-dev/discord-presence/archive/${_discord_presence_commit}.tar.gz"
)
sha256sums=('SKIP'
            'eaf6d9920edfa6a3d5005c25a3fdb8334d24b1d73401756f22da8106f84dedd1'
            'eb7d8f3cf35590f3bfde855f7be916bd208fa97037dc7e6855e869bca844b6a6')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-\([0-9]\+\)-g/.r\1.g/;s/-/./g'
}

prepare() {
    sed -i \
        '/^# === DEPENDENCIES === #/a find_package(fmt REQUIRED)' \
        "${pkgname%-git}/CMakeLists.txt"
}

build() {
    CXXFLAGS+=" -ffile-prefix-map=$srcdir=."
    cmake \
        -S "${pkgname%-git}" \
        -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DFETCHCONTENT_FULLY_DISCONNECTED=ON \
        -DFETCHCONTENT_SOURCE_DIR_GLAZE="$srcdir/glaze-7.8.1" \
        -DFETCHCONTENT_SOURCE_DIR_DISCORD-RPC="$srcdir/discord-presence-${_discord_presence_commit}"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 \
        "${pkgname%-git}/LICENCE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
