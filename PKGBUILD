# Maintainer: dim-ghub <59436063+dim-ghub@users.noreply.github.com>

pkgname=venture
pkgver=0.2.4
pkgrel=1
pkgdesc='Meta Quest emulator for PC VR'
arch=('x86_64')
url='https://venture-emu.org/'
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs' 'vulkan-icd-loader')
makedepends=('clang' 'lld' 'llvm' 'cmake' 'ninja' 'git' 'python' 'make' 'pkgconf' 'curl')
optdepends=('libsecret: keep sign-ins in the desktop keyring'
            'fontconfig: system fonts in the launcher'
            'monado: OpenXR runtime'
            'wivrn-server: OpenXR runtime for streaming to a standalone headset')
provides=("$pkgname")
conflicts=("$pkgname-bin" "$pkgname-git")
# Upstream strips the release layout itself; ANGLE and FFmpeg use their own flags.
options=('!strip' '!debug' '!lto')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Villagers654/Venture/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('055dd9230e59b6ca0f4fe2692d4975a1a19fa28741a902d227749168e5a6d505')

_srcname="Venture-$pkgver"

_venture_env() {
    # Keep upstream's toolchain, ANGLE and FetchContent caches inside $srcdir.
    export VENTURE_DATA_DIR="$srcdir/venture-data"
    export XDG_CACHE_HOME="$srcdir/cache"
    export CC=clang CXX=clang++
}

build() {
    cd "$srcdir/$_srcname"
    _venture_env
    # Pinned JDK, dex2jar, LGPL audio-only FFmpeg and Vulkan-only ANGLE.
    python tools/bootstrap.py --jdk --angle
    cmake --preset linux-release \
        -DCMAKE_BUILD_TYPE=Release \
        -DVENTURE_BUILD_TESTS=OFF
    cmake --build build/linux-release --target all package-release
}

package() {
    cd "$srcdir/$_srcname"
    local _id=org.venture_emu.Venture
    install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin"
    cp -a dist/Venture-linux64/. "$pkgdir/opt/$pkgname/"
    ln -s "/opt/$pkgname/venture" "$pkgdir/usr/bin/venture"
    install -Dm644 "tools/packaging/linux/$_id.desktop" "$pkgdir/usr/share/applications/$_id.desktop"
    install -Dm644 src/launcher/assets/venture.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_id.svg"
    install -d "$pkgdir/usr/share/metainfo"
    sed "s/@VERSION@/$pkgver/" "tools/packaging/linux/$_id.metainfo.xml" > "$pkgdir/usr/share/metainfo/$_id.metainfo.xml"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
