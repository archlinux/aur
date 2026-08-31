# Maintainer: Your Name <your@email.com>
pkgname=hyprfm-git
pkgver=r423.g5d3c693
pkgrel=1
pkgdesc="A lightweight Qt6/QML file manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/soyeb-jim285/hyprfm"
license=('MIT')
depends=(
    'glib2'
    'gvfs'
    'kwindowsystem'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-wayland'
    'xdg-utils'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
    'kwindowsystem'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
)
optdepends=(
    'wl-clipboard: clipboard support via wl-copy and wl-paste'
    'fd: fast recursive search (falls back to a built-in walker)'
    'bat: syntax-highlighted text previews'
    'gvfs-smb: SMB/CIFS remote browsing support'
    'gvfs-mtp: Android phones (MTP) in the sidebar'
    'ffmpeg: video thumbnails and audio/video metadata (via ffprobe)'
    'poppler: PDF thumbnails, previews, and metadata (via pdftoppm/pdfinfo)'
    'perl-image-exiftool: EXIF metadata for images (via exiftool)'
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
    cmake -B build -S "${pkgname}" -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DHYPRFM_DATA_DIR=/usr/share/hyprfm
    cmake --build build --parallel
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

    # Install desktop entry, icon and AppStream metainfo
    install -Dm644 "${pkgname}/dist/io.github.soyeb_jim285.HyprFM.desktop" \
        "${pkgdir}/usr/share/applications/io.github.soyeb_jim285.HyprFM.desktop"
    install -Dm644 "${pkgname}/dist/io.github.soyeb_jim285.HyprFM.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.soyeb_jim285.HyprFM.svg"
    install -Dm644 "${pkgname}/dist/io.github.soyeb_jim285.HyprFM.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/io.github.soyeb_jim285.HyprFM.metainfo.xml"

    # Install license
    install -Dm644 "${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
