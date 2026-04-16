# Maintainer: Rimso
pkgname=simpleautoframer-git
_pkgname=simpleautoframer
pkgver=r1.0
pkgrel=1
pkgdesc="Open-source auto-framing for webcams (alternative to NVIDIA Broadcast)"
arch=('x86_64' 'aarch64')
url="https://github.com/Rimsoo/SimpleAutoFramer"
license=('MIT') # Change to match your LICENSE file

depends=(
    'opencv'
    'gtkmm3'
    'libayatana-appindicator'
    'nlohmann-json'
    'glib2'
    'libx11'
    'libxi'
    'hicolor-icon-theme'
    'v4l2loopback-dkms'
)

makedepends=(
    'cmake'
    'git'
    'pkgconf'
)

optdepends=(
    'xdg-desktop-portal: required for global shortcuts under Wayland'
    'xdg-desktop-portal-kde: portal backend for KDE Plasma'
    'xdg-desktop-portal-gnome: portal backend for GNOME (>=47 recommended)'
    'xdg-desktop-portal-hyprland: portal backend for Hyprland'
    'xdg-desktop-portal-wlr: portal backend for Sway/other wlroots WMs'
    'cuda: optional GPU acceleration (rebuild with -DUSE_CUDA=ON)'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "$_pkgname::git+$url.git"
    "v4l2loopback.conf"
    "v4l2loopback-modules-load.conf"
    "$_pkgname.install"
)
sha256sums=(
    'SKIP'
    'SKIP' # regenerate with updpkgsums
    'SKIP'
    'SKIP'
)
install="$_pkgname.install"

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    git submodule update --init --recursive
}

build() {
    cd "$_pkgname"

    # Prefer the distro OpenCV over /usr/local custom builds. A common Arch
    # pitfall: /usr/local/lib/cmake/opencv4/ pins an exact CUDA version
    # ("Found unsuitable version 13.2, required exactly 12.8") which breaks
    # configure. /usr/lib/cmake/opencv4/ (shipped by the opencv /
    # opencv-cuda packages) works everywhere.
    local -a opencv_dir_arg=()
    if [[ -z "${OpenCV_DIR:-}" && -f /usr/lib/cmake/opencv4/OpenCVConfig.cmake ]]; then
        opencv_dir_arg=(-DOpenCV_DIR=/usr/lib/cmake/opencv4)
    fi

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_MODE=ON \
        -DUSE_CUDA=OFF \
        -DUSE_X11_SHORTCUTS=ON \
        -DUSE_PORTAL_SHORTCUTS=ON \
        "${opencv_dir_arg[@]}" \
        -Wno-dev
    cmake --build build
}

package() {
    cd "$_pkgname"
    DESTDIR="$pkgdir" cmake --install build

    # LICENSE
    if [[ -f LICENSE ]]; then
        install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    fi

    # v4l2loopback persistence (do NOT modprobe inside PKGBUILD!)
    install -Dm0644 "$srcdir/v4l2loopback.conf" \
        "$pkgdir/etc/modprobe.d/v4l2loopback-simpleautoframer.conf"
    install -Dm0644 "$srcdir/v4l2loopback-modules-load.conf" \
        "$pkgdir/usr/lib/modules-load.d/simpleautoframer.conf"
}
