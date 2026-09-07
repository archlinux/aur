# Maintainer: Vendetta1871 <conqueror.v.v.v.v.v@gmail.com>

pkgname=prismlauncher-offline-git
pkgver=11.0.3.r7.gd393323fd
pkgrel=1
pkgdesc="Prism Launcher fork with offline account support enabled (git version)"
arch=('x86_64')
url="https://github.com/Diegiwg/PrismLauncher-Cracked"
license=('GPL-3.0-only')
depends=(
    cmark
    gcc-libs
    glibc
    hicolor-icon-theme
    libarchive
    libgl
    qrencode
    qt6-base
    qt6-imageformats
    qt6-networkauth
    qt6-svg
    qt6-wayland
    tomlplusplus
    zlib
)
makedepends=(
    cmake
    extra-cmake-modules
    gamemode
    git
    jdk17-openjdk
    ninja
    scdoc
    vulkan-headers
)
optdepends=(
    'java-runtime: use system Java instead of the bundled downloader'
    'java-runtime=8: for older Minecraft versions'
    'glfw: to use system GLFW libraries'
    'openal: to use system OpenAL libraries'
    'xorg-xrandr: for older Minecraft versions'
    'gamemode: to optimize gameplay'
    'flite: Minecraft voice narration'
)
provides=('prismlauncher' 'prismlauncher-offline')
conflicts=('prismlauncher' 'prismlauncher-offline')
# LTO costs a lot of build time and memory here for no measurable gain
options=('!lto')

source=(
    "git+${url}.git"
    'git+https://github.com/PrismLauncher/libnbtplusplus.git'
)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
    cd "$srcdir/PrismLauncher-Cracked"
    if _desc=$(git describe --long --tags 2>/dev/null); then
        printf '%s' "$_desc" | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf '0.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    fi
}

prepare() {
    cd "$srcdir/PrismLauncher-Cracked"
    git submodule init
    # use the clone makepkg already fetched instead of hitting the network again
    git config submodule.libraries/libnbtplusplus.url "$srcdir/libnbtplusplus"
    git config submodule.flatpak/shared-modules.active false
    git -c protocol.file.allow=always submodule update
}

build() {
    export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

    cmake -S PrismLauncher-Cracked -B build -G Ninja \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DLauncher_BUILD_PLATFORM='archlinux' \
        -DLauncher_APP_BINARY_NAME='prismlauncher' \
        -DLauncher_QT_VERSION_MAJOR='6' \
        -DLauncher_ENABLE_JAVA_DOWNLOADER=ON \
        -DBUILD_TESTING=OFF \
        -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$srcdir/PrismLauncher-Cracked/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
