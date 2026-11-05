# Maintainer: Rimso
pkgname=simpleautoframer-git
_pkgname=simpleautoframer
pkgver=r1.0
pkgrel=1
pkgdesc="Open-source auto-framing for webcams (alternative to NVIDIA Broadcast)"
arch=('x86_64' 'aarch64')
url="https://github.com/Rimsoo/SimpleAutoFramer"
license=('MIT')

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

backup=('etc/modprobe.d/v4l2loopback-simpleautoframer.conf')

optdepends=(
    'xdg-desktop-portal: required for global shortcuts under Wayland'
    'xdg-desktop-portal-kde: portal backend for KDE Plasma'
    'xdg-desktop-portal-gnome: portal backend for GNOME (>=47 recommended)'
    'xdg-desktop-portal-hyprland: portal backend for Hyprland'
    'xdg-desktop-portal-wlr: portal backend for Sway/other wlroots WMs'
    'opencv-cuda: run the YuNet face detector on an NVIDIA GPU'
)

provides=("$_pkgname")
conflicts=("$_pkgname")

source=(
    "$_pkgname::git+$url.git"
    "libv4l2cpp::git+https://github.com/mpromonet/libv4l2cpp.git"
    "v4l2loopback.conf"
    "v4l2loopback-modules-load.conf"
    "$_pkgname.install"
)
sha256sums=('SKIP'
            'SKIP'
            '3b4ec0e8c362a04c0a028004fef48aaccf7985084f29af9a0a4c527f5847f53c'
            '0a9b6fa6a540c07d2dc881fcd20c9456df050cb3b2717110c7b1456f622d0f5d'
            '127762625f91d0f78fabe4927d6a6196717b5ad3de9f8ed796c2b2b0d093ddb4')
install="$_pkgname.install"

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$_pkgname"
    # Use the submodule fetched by makepkg (no network access in prepare()).
    git submodule init
    git config submodule.libv4l2cpp.url "$srcdir/libv4l2cpp"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$_pkgname"

    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DINSTALL_MODE=ON \
        -DUSE_X11_SHORTCUTS=ON \
        -DUSE_PORTAL_SHORTCUTS=ON \
        -DINSTALL_UNINSTALLER=OFF \
        -Wno-author
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
