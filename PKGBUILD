# Maintainer: Marco Antonio Alvarez <surakus@pm.me>
#
# This PKGBUILD is published to the AUR (aur.archlinux.org/packages/tesseract-matrix-git)
# and is maintained in its own AUR git repo, not this one. It is kept here as
# the source of truth to copy from. See ../README.md for the publish
# procedure.
pkgname=tesseract-matrix-git
pkgver=0.8.18.r17.g32dbb5f1
pkgrel=1
pkgdesc="Cross-platform Matrix chat client (latest git build)"
arch=('x86_64')
url="https://github.com/surakin/tesseract"
license=('GPL-3.0-or-later')
# ring (pulled in via rustls/webrtc-sys) compiles its C/asm core through the
# `cc` crate, which inherits Arch's default -flto=auto CFLAGS/LDFLAGS; the
# resulting objects lack real machine code for symbols the Rust side needs
# at link time, producing "undefined symbol: ring_core_*" errors.
options=('!lto')
provides=('tesseract-matrix')
conflicts=('tesseract-matrix')
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
    'libsecret'
)
makedepends=(
    'git'
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
source=("$pkgname::git+https://github.com/surakin/tesseract.git#branch=development")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -S "$pkgname" -B build -G Ninja \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DTESSERACT_UI=qt6
    cmake --build build
}

# No check() — see the note in ../tesseract-matrix/PKGBUILD.

package() {
    # CMake's install(CODE) in ui/linux-qt/CMakeLists.txt already renames
    # the binary, desktop file, and icon from `tesseract` to `tesseract-matrix`
    # and patches the desktop file's Exec/Icon/StartupWMClass fields.
    DESTDIR="$pkgdir" cmake --install build
}
