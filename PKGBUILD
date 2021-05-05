# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=duckstation-opt-git
pkgver=r4442.d3fea7b5
pkgdesc='A Sony PlayStation (PSX) emulator, focusing on playability, speed, and long-term maintainability (Installed to /opt, git version)'
pkgrel=1
arch=(x86_64 aarch64)
url=https://github.com/stenzek/duckstation
license=(GPL3)
makedepends=(git cmake extra-cmake-modules qt5-tools libdrm gtk3 ninja)
depends=(sdl2 qt5-base)
optdepends=()
provides=("${pkgname%-opt-git}")
conflicts=("${pkgname%-opt-git}")
source=(git+"$url".git)
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/duckstation"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S duckstation \
        -DUSE_DRMKMS=ON \
        -DUSE_WAYLAND=ON \
        -G Ninja
    ninja -C build
}

package() {
    # Main files
    install -m755 -d "${pkgdir}/opt"
    cp -rv build/bin "${pkgdir}/opt/${pkgname%-opt-git}"

    # Symlink to /usr/bin
    install -m755 -d "${pkgdir}/usr/bin"
    ln -svt "${pkgdir}/usr/bin" /opt/"${pkgname%-opt-git}"/"${pkgname%-opt-git}"-{qt,nogui}

    # Desktop file
    install -Dm644 -t "${pkgdir}/usr/share/applications/" "${pkgname%-opt-git}"/dist/duckstation-{qt,nogui}.desktop
    sed -e 's/Icon=duckstation-qt/Icon=duckstation/' -i "${pkgdir}/usr/share/applications/duckstation-qt.desktop"
    sed -e 's/Icon=duckstation-qt/Icon=duckstation/' -i "${pkgdir}/usr/share/applications/duckstation-nogui.desktop"
    install -Dm644 "${pkgname%-opt-git}"/dist/icon-64px.png "${pkgdir}/usr/share/pixmaps/duckstation.png"
}
