# Maintainer: Maxim Korotkov <maximkorotkov4@gmail.com>

pkgname=honkers-launcher-git
_pkgname="${pkgname%-git}"
pkgver=1.0.0.r1.g80fb522
pkgrel=1
pkgdesc="A launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/honkers-launcher"
provides=("honkers-launcher")
conflicts=("honkers-launcher-bin")
arch=("x86_64")
license=("GPL3")

pkgver(){
    cd "$_pkgname"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

depends=(
    "libadwaita"
    "tar"
    "unzip"
    "xdelta3"
    "cabextract"
    "git"
    "iputils"
    "gtk4"
    "glibc"
)

makedepends=(rust)

optdepends=(
    "mangohud: FPS Hud/GUI"
    "gamemode: Game Optimizations"
    "gamescope: a tool from Valve that allows for games to run in an isolated Xwayland instance"
)

source=(
    "git+https://github.com/an-anime-team/honkers-launcher"
    "icon.png"
    "honkers-launcher.desktop"
)

md5sums=(
    SKIP
    '26b637e96d0f4382c8b132656a9ce3a5'
    '739854fbecc047beb55d738dbdfe85d9'
)

prepare() {
    cd $_pkgname
    git switch next
    git submodule update --init --recursive --single-branch
}

build() {
    cd $_pkgname
    cargo build --release
}

package() {
    cd $_pkgname
    
    install -dm755 "${pkgdir}/usr/lib/${pkgname}"
    install -dm755 "${pkgdir}/usr/bin/"
    cp target/release/honkers-launcher "${pkgdir}/usr/lib/${pkgname}/honkers-launcher"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/honkers-launcher.png"
    ln -s "/usr/lib/${pkgname}/honkers-launcher" "${pkgdir}/usr/bin/honkers-launcher"
    install -Dm644 "${srcdir}/honkers-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.honkers-launcher.png"
}

