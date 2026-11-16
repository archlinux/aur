# Maintainer: Your Name <your@email.com>
pkgname=hyprfm-git
pkgver=r744.g9808dd3
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
    'zig'
    'kwindowsystem'
    'qt6-base'
    'qt6-declarative'
    'qt6-svg'
)
optdepends=(
    'wl-clipboard: clipboard support via wl-copy and wl-paste'
    'fd: fast recursive search (falls back to a built-in walker)'
    'bat: syntax-highlighted text previews'
    'md4c: rendered Markdown previews (via md2html)'
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
    # Everything CMake installs: the binary, the file chooser portal backend
    # (with its .portal, D-Bus and systemd user files), themes, the QML module,
    # desktop entry, icon and metainfo. A hand-kept list here fell behind and
    # shipped without the portal.
    DESTDIR="${pkgdir}" cmake --install build

    install -Dm644 "${pkgname}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

