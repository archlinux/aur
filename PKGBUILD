# Maintainer: Your Name <your@email.com>
pkgname=hyprfm-git
pkgver=r.0.g0000000
pkgrel=1
pkgdesc="A lightweight Qt6/QML file manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/soyeb-jim285/hyprfm"
license=('MIT')
depends=(
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-wayland'
    'rsync'
    'xdg-utils'
)
makedepends=(
    'cmake'
    'git'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
)
optdepends=(
    'wl-clipboard: clipboard support via wl-copy'
    'glib2: file operations via gio'
)
provides=('hyprfm')
conflicts=('hyprfm')
source=(
    "${pkgname}::git+https://github.com/soyeb-jim285/hyprfm.git"
    "quill-icons::git+https://github.com/soyeb-jim285/quill-icons.git"
    "quill::git+https://github.com/soyeb-jim285/quill.git"
)
sha256sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${pkgname}"
    git submodule init
    git config submodule.src/qml/icons.url "${srcdir}/quill-icons"
    git config submodule.src/qml/Quill.url "${srcdir}/quill"
    git -c protocol.file.allow=always submodule update
}

build() {
    # HYPRFM_SOURCE_DIR is baked in at compile time; point it to the installed
    # data directory so the binary finds themes and QML after installation.
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DCMAKE_CXX_FLAGS="-DHYPRFM_SOURCE_DIR=\\\"/usr/share/hyprfm\\\""
    cmake --build build
}

package() {
    # Install the compiled binary
    install -Dm755 "build/src/hyprfm" "${pkgdir}/usr/bin/hyprfm"

    # Install themes — loaded via applicationDirPath()/../themes → /usr/share/hyprfm/themes
    install -dm755 "${pkgdir}/usr/share/hyprfm/themes"
    install -Dm644 "${pkgname}/themes/"*.toml \
        -t "${pkgdir}/usr/share/hyprfm/themes/"

    # Install QML sources — the binary adds HYPRFM_SOURCE_DIR/src/qml to the
    # QML import path at runtime for the HyprFM and Quill modules.
    install -dm755 "${pkgdir}/usr/share/hyprfm/src"
    cp -r "${pkgname}/src/qml" "${pkgdir}/usr/share/hyprfm/src/qml"

    # Install license
    install -Dm644 "${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
