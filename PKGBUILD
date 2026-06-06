# Maintainer: akumaburn <a.eslampanah@live.com>
# Contributor: Doxxed By-MlgmXyysd <standwithtsaiporn@mail.ru>
# Contributor: Maxim Korotkov <maximkorotkov4@gmail.com>

pkgname=the-honkers-railway-launcher-git
_pkgname="${pkgname%-git}"
pkgver=1.15.1.r0.g9266f1a
pkgrel=1
pkgdesc="A launcher for a specific anime game with auto-patching, discord rpc and time tracking"
url="https://github.com/an-anime-team/the-honkers-railway-launcher"
arch=('x86_64')
license=('GPL-3.0-or-later')
provides=("${_pkgname}")
conflicts=("${_pkgname}" "${_pkgname}-bin")
options=('!lto')

depends=(
    'libadwaita'
    'tar'
    'unzip'
    'xdg-desktop-portal'
    'xdelta3'
    'cabextract'
    'git'
    'iputils'
    'gtk4'
    'glibc'
)

makedepends=(
    'cargo'
    'git'
)

optdepends=(
    'mangohud: FPS Hud/GUI'
    'gamemode: Game Optimizations'
    'gamescope: A tool from Valve that allows for games to run in an isolated Xwayland instance'
)

source=(
    "git+${url}.git"
    'icon.png'
    'the-honkers-railway-launcher.desktop'
)

md5sums=(
    'SKIP'
    '3a9757edaaa59d9696ffc1ffacdafb30'
    '3817083b3f90f0ec4e5290a914dcaa9b'
)

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${_pkgname}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "${_pkgname}"

    install -Dm755 'target/release/honkers-railway-launcher' \
        "${pkgdir}/usr/bin/the-honkers-railway-launcher"
    install -Dm644 "${srcdir}/the-honkers-railway-launcher.desktop" \
        -t "${pkgdir}/usr/share/applications/"
    install -Dm644 "${srcdir}/icon.png" \
        "${pkgdir}/usr/share/pixmaps/the-honkers-railway-launcher.png"
    install -Dm644 "${srcdir}/icon.png" \
        "${pkgdir}/usr/share/icons/moe.launcher.the-honkers-railway-launcher.png"
    install -Dm644 'LICENSE' \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
