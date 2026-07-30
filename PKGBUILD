# Maintainer: Marco Antonio Alvarez <surakus@pm.me>
#
# This PKGBUILD is published to the AUR (aur.archlinux.org/packages/tesseract-matrix)
# and is maintained in its own AUR git repo, not this one. It is kept here as
# the source of truth to copy from. See ../README.md for the publish
# procedure and how to bump pkgver for a new release.
pkgname=tesseract-matrix
pkgver=0.8.16
pkgrel=1
pkgdesc="Cross-platform Matrix chat client"
arch=('x86_64')
url="https://github.com/surakin/tesseract"
license=('GPL3')
# The binary is installed as `tesseract-matrix` (not `tesseract`) so this
# package can coexist with the unrelated Tesseract OCR engine, which owns
# /usr/bin/tesseract.
depends=(
    'qt6-base'
    'qt6-multimedia'
    'opus'               # Opus codec (voice messages)
    'gstreamer'          # GStreamer core runtime
    'gst-plugins-base'   # Opus decoder for MSC3245 voice messages + gstreamer-app
    'gst-plugins-good'   # additional codec support
    'ffmpeg'             # libavutil: silence av_log output at startup
    'emoji-font'         # emoji glyph rendering (provided by noto-fonts-emoji)
)
makedepends=(
    'cmake'
    'ninja'
    'rust'
    'go'
    'perl'
    'qt6-base'           # includes private headers (GuiPrivate)
    'qt6-multimedia'
    'wayland'            # xdg-activation Wayland window focus (find_library at configure time)
    'opus'
    'gstreamer'
    'gst-plugins-base'
    'ffmpeg'             # libavutil headers
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/surakin/tesseract/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31cdb698c7bef1d2e3a68e96494f03b0fbc288d6f0e2dee6ddc76f1ab9dffb7c')

build() {
    cmake -S "tesseract-$pkgver" -B build -G Ninja \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DTESSERACT_UI=qt6
    cmake --build build
}

# No check(): the project's own release CI (package.yml/build-platform.yml)
# never runs ctest when producing installers either. The Catch2 suite spins
# up a bare QGuiApplication with no QPA fallback (aborts with no display,
# as in a clean chroot) and the [keychain]-tagged session-store tests hit
# the real OS secret service, which isn't running in a clean chroot.

package() {
    # CMake's install(CODE) in ui/linux-qt/CMakeLists.txt already renames
    # the binary, desktop file, and icon from `tesseract` to `tesseract-matrix`
    # and patches the desktop file's Exec/Icon/StartupWMClass fields.
    DESTDIR="$pkgdir" cmake --install build
}
