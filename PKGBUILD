# Maintainer: dim-ghub <59436063+dim-ghub@users.noreply.github.com>

pkgname=venture-git
_pkgname=venture
pkgver=0.2.4.r0.gf5cca87
pkgrel=1
pkgdesc='Meta Quest emulator for PC VR (git main)'
arch=('x86_64')
url='https://venture-emu.org/'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'vulkan-icd-loader')
makedepends=('clang' 'lld' 'llvm' 'cmake' 'ninja' 'git' 'python' 'make' 'pkgconf' 'curl')
optdepends=('libsecret: keep sign-ins in the desktop keyring'
            'fontconfig: system fonts in the launcher'
            'monado: OpenXR runtime'
            'wivrn-server: OpenXR runtime for streaming to a standalone headset')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-bin")
# Upstream strips the release layout itself; ANGLE and FFmpeg use their own flags.
options=('!strip' '!debug' '!lto')
source=("$_pkgname::git+https://github.com/Villagers654/Venture.git#branch=main")
sha256sums=('SKIP')

_venture_env() {
    # Keep upstream's toolchain, ANGLE and FetchContent caches inside $srcdir.
    export VENTURE_DATA_DIR="$srcdir/venture-data"
    export XDG_CACHE_HOME="$srcdir/cache"
    export CC=clang CXX=clang++
}

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    _venture_env
    # Pinned JDK, dex2jar, LGPL audio-only FFmpeg and Vulkan-only ANGLE.
    python tools/bootstrap.py --jdk --angle
    cmake --preset linux-release \
        -DCMAKE_BUILD_TYPE=Release \
        -DVENTURE_BUILD_TESTS=OFF
    cmake --build build/linux-release --target all package-release
}

package() {
    cd "$srcdir/$_pkgname"
    local _id=org.venture_emu.Venture
    local _ver
    _ver=$(sed -n 's/^project(Venture VERSION \([0-9.]*\).*/\1/p' CMakeLists.txt)
    install -d "$pkgdir/opt/$_pkgname" "$pkgdir/usr/bin"
    cp -a dist/Venture-linux64/. "$pkgdir/opt/$_pkgname/"
    ln -s "/opt/$_pkgname/venture" "$pkgdir/usr/bin/venture"
    install -Dm644 "tools/packaging/linux/$_id.desktop" "$pkgdir/usr/share/applications/$_id.desktop"
    install -Dm644 src/launcher/assets/venture.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_id.svg"
    install -d "$pkgdir/usr/share/metainfo"
    sed "s/@VERSION@/$_ver/" "tools/packaging/linux/$_id.metainfo.xml" > "$pkgdir/usr/share/metainfo/$_id.metainfo.xml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
