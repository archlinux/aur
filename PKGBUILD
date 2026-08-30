# Maintainer: Raphael <raphamzn@gmail.com>
pkgname=seraph-git
pkgver=r318.g0539d4e
pkgrel=1
pkgdesc="A lightweight Qt6/QML file manager for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/raphamzn/seraph"
license=('MIT')
depends=(
    'glib2'
    'kwindowsystem'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-wayland'
    'fd'
    'xdg-utils'
)
makedepends=(
    'cmake'
    'ninja'
    'git'
)
optdepends=(
    'wl-clipboard: clipboard support via wl-copy and wl-paste'
    'bat: syntax-highlighted text previews'
    'gvfs: remote filesystem support via gio/gvfs (sftp, ftp, dav, etc.)'
    'gvfs-smb: SMB/CIFS remote browsing support'
    'ffmpeg: video thumbnails and audio/video metadata (via ffprobe)'
    'poppler: PDF thumbnails, previews, and metadata (via pdftoppm/pdfinfo)'
    'perl-image-exiftool: EXIF metadata for images (via exiftool)'
    'udisks2: mount/unmount devices from sidebar'
)
provides=("seraph=${pkgver}")
conflicts=('seraph')
source=(
    "${pkgname}::git+https://github.com/raphamzn/seraph.git"
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
        -DSERAPH_DATA_DIR=/usr/share/seraph
    cmake --build build --parallel
}

package() {
    # Install the compiled binary
    install -Dm755 "build/src/seraph" "${pkgdir}/usr/bin/seraph"

    # Install themes — loaded via applicationDirPath()/../themes → /usr/share/seraph/themes
    install -dm755 "${pkgdir}/usr/share/seraph/themes"
    install -Dm644 "${pkgname}/themes/"*.toml \
        -t "${pkgdir}/usr/share/seraph/themes/"

    # Install QML module metadata (needed for loadFromModule to find Seraph)
    install -Dm644 "build/src/Seraph/qmldir" \
        "${pkgdir}/usr/share/seraph/Seraph/qmldir"
    install -Dm644 "build/src/Seraph/seraph.qmltypes" \
        "${pkgdir}/usr/share/seraph/Seraph/seraph.qmltypes" 2>/dev/null || true

    # Install QML sources for Quill module
    install -dm755 "${pkgdir}/usr/share/seraph/src"
    cp -r "${pkgname}/src/qml" "${pkgdir}/usr/share/seraph/src/qml"

    # Quill's standalone demo imports Quickshell, which Seraph does not use and
    # does not depend on. It is not registered in Quill's qmldir, so dropping it
    # keeps namcap from reporting a missing quickshell dependency.
    rm -rf "${pkgdir}/usr/share/seraph/src/qml/Quill/Showcase.qml" \
           "${pkgdir}/usr/share/seraph/src/qml/Quill/showcase"

    # Install desktop entry, icon and AppStream metainfo
    install -Dm644 "${pkgname}/dist/io.github.raphamzn.Seraph.desktop" \
        "${pkgdir}/usr/share/applications/io.github.raphamzn.Seraph.desktop"
    install -Dm644 "${pkgname}/dist/io.github.raphamzn.Seraph.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.raphamzn.Seraph.svg"
    install -Dm644 "${pkgname}/dist/io.github.raphamzn.Seraph.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/io.github.raphamzn.Seraph.metainfo.xml"

    # Install license
    install -Dm644 "${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
