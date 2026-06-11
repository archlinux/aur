# Maintainer: blackbartblues <wojciechsulocki@gmail.com>
pkgname=wayfile-git
pkgver=r447.g78a2fec
pkgrel=1
pkgdesc="An obsidian-and-gold Qt6/QML file manager for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/blackbartblues/Wayfile"
license=('MIT')
depends=(
    'glib2'
    'kwindowsystem'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
    'qt6-multimedia'
    'qt6-wayland'
    'fd'
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
    'qt6-multimedia'
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
provides=('wayfile')
conflicts=('wayfile')
source=(
    "${pkgname}::git+https://github.com/blackbartblues/Wayfile.git"
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
        -DWAYFILE_DATA_DIR=/usr/share/wayfile
    cmake --build build --parallel
}

package() {
    # Install the compiled binary
    install -Dm755 "build/src/wayfile" "${pkgdir}/usr/bin/wayfile"

    # Install themes — loaded via applicationDirPath()/../themes → /usr/share/wayfile/themes
    install -dm755 "${pkgdir}/usr/share/wayfile/themes"
    install -Dm644 "${pkgname}/themes/"*.toml \
        -t "${pkgdir}/usr/share/wayfile/themes/"

    # Install QML module metadata (needed for loadFromModule to find Wayfile)
    install -Dm644 "build/src/Wayfile/qmldir" \
        "${pkgdir}/usr/share/wayfile/Wayfile/qmldir"
    install -Dm644 "build/src/Wayfile/wayfile.qmltypes" \
        "${pkgdir}/usr/share/wayfile/Wayfile/wayfile.qmltypes" 2>/dev/null || true

    # Install QML sources for Quill module
    install -dm755 "${pkgdir}/usr/share/wayfile/src"
    cp -r "${pkgname}/src/qml" "${pkgdir}/usr/share/wayfile/src/qml"

    # Install desktop entry, icon and AppStream metainfo
    install -Dm644 "${pkgname}/dist/io.github.blackbartblues.Wayfile.desktop" \
        "${pkgdir}/usr/share/applications/io.github.blackbartblues.Wayfile.desktop"
    install -Dm644 "${pkgname}/dist/io.github.blackbartblues.Wayfile.svg" \
        "${pkgdir}/usr/share/icons/hicolor/scalable/apps/io.github.blackbartblues.Wayfile.svg"
    install -Dm644 "${pkgname}/dist/io.github.blackbartblues.Wayfile.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/io.github.blackbartblues.Wayfile.metainfo.xml"

    # Install license
    install -Dm644 "${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
