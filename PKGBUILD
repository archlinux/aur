# Maintainer: TheBrokenRail <connor24nolan@live.com>
pkgname="minecraft-pi-reborn-git"
pkgver=2.4.8.r0.gc3fda82
pkgrel=1
pkgdesc="Minecraft: Pi Edition Modding Project"
arch=("armv7h" "aarch64" "x86_64")
url="https://gitea.thebrokenrail.com/TheBrokenRail/minecraft-pi-reborn"
license=('MIT' "custom")
depends=("gtk3" "glib2" "openal" "libxi" "libxrandr" "libxinerama" "libxcursor" "wayland" "libxkbcommon")
makedepends=("git" "cmake" "ninja" "gcc" "wayland-protocols" "mesa" "python")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("minecraft-pi-reborn::git+https://gitea.thebrokenrail.com/minecraft-pi-reborn/minecraft-pi-reborn")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/minecraft-pi-reborn"
    git describe --long --tags --abbrev=7 | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

prepare() {
    cd "$srcdir/minecraft-pi-reborn"
    git submodule init
    git submodule update --init --recursive
}

_get_arch() {
    case "$CARCH" in
        armv7h)
            echo "armhf"
            ;;
        aarch64)
            echo "arm64"
            ;;
        x86_64)
            echo "amd64"
            ;;
    esac
}

build() {
    cd "$srcdir/minecraft-pi-reborn"
    unset CFLAGS CXXFLAGS # These Break Cross-Compiling
    ./scripts/build.sh client "$(_get_arch)"
}

package() {
    cd "$srcdir/minecraft-pi-reborn"
    cp -ar "out/client-$(_get_arch)/." "$pkgdir"
}
