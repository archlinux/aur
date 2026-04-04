# Maintainer: Your Name <your@email.com>
pkgname=hyprfm-git
pkgver=r153.gd0b73cc
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
    'fd'
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
    'wl-clipboard: clipboard support via wl-copy and wl-paste'
    'glib2: local and trash file operations via gio'
    'gvfs: remote filesystem support via gio/gvfs (sftp, ftp, dav, etc.)'
    'gvfs-smb: SMB/CIFS remote browsing support'
    'ffmpeg: video file thumbnail previews'
    'udisks2: mount/unmount devices from sidebar'
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
    cmake -B build -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DHYPRFM_DATA_DIR=/usr/share/hyprfm
    cmake --build build
}

package() {
    # Install the compiled binary
    install -Dm755 "build/src/hyprfm" "${pkgdir}/usr/bin/hyprfm"

    # Install themes — loaded via applicationDirPath()/../themes → /usr/share/hyprfm/themes
    install -dm755 "${pkgdir}/usr/share/hyprfm/themes"
    install -Dm644 "${pkgname}/themes/"*.toml \
        -t "${pkgdir}/usr/share/hyprfm/themes/"

    # Install QML module metadata (needed for loadFromModule to find HyprFM)
    install -Dm644 "build/src/HyprFM/qmldir" \
        "${pkgdir}/usr/share/hyprfm/HyprFM/qmldir"
    install -Dm644 "build/src/HyprFM/hyprfm.qmltypes" \
        "${pkgdir}/usr/share/hyprfm/HyprFM/hyprfm.qmltypes" 2>/dev/null || true

    # Install QML sources for Quill module
    install -dm755 "${pkgdir}/usr/share/hyprfm/src"
    cp -r "${pkgname}/src/qml" "${pkgdir}/usr/share/hyprfm/src/qml"

    # Install desktop entry and icon
    install -Dm644 "${pkgname}/dist/hyprfm.desktop" \
        "${pkgdir}/usr/share/applications/hyprfm.desktop"
    install -Dm644 "${pkgname}/dist/hyprfm.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/hyprfm.svg"

    # Install license
    install -Dm644 "${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
