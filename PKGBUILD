# Maintainer: Doxxed By-MlgmXyysd <standwithtsaiporn@mail.ru>
# Contributor: Maxim Korotkov <maximkorotkov4@gmail.com>

pkgname=the-honkers-railway-launcher-git
_pkgname="${pkgname%-git}"
pkgver=1.2.2.r18.gb8f585e
pkgrel=1
pkgdesc="A launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/the-honkers-railway-launcher"
provides=("the-honkers-railway-launcher")
conflicts=("the-honkers-railway-launcher-bin")
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
    "xdg-desktop-portal"
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
    "gamescope: A tool from Valve that allows for games to run in an isolated Xwayland instance"
)

source=(
    "git+https://github.com/an-anime-team/the-honkers-railway-launcher"
    "icon.png"
    "the-honkers-railway-launcher.desktop"
)

md5sums=(
    SKIP
    '3a9757edaaa59d9696ffc1ffacdafb30'
    '3817083b3f90f0ec4e5290a914dcaa9b'
)

prepare() {
    cd $_pkgname
    git switch next
    git pull
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
    cp target/release/honkers-railway-launcher "${pkgdir}/usr/lib/${pkgname}/the-honkers-railway-launcher"

    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/pixmaps/the-honkers-railway-launcher.png"
    ln -s "/usr/lib/${pkgname}/the-honkers-railway-launcher" "${pkgdir}/usr/bin/the-honkers-railway-launcher"
    install -Dm644 "${srcdir}/the-honkers-railway-launcher.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/usr/share/icons/moe.launcher.the-honkers-railway-launcher.png"
}

