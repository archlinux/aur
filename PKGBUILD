# Maintainer: cat_nm
# Maintainer: jaskir
pkgname=ags-hyprpanel-git
pkgver=r492.2751237
pkgrel=1
pkgdesc="A Bar/Panel for Hyprland with extensive customizability"
arch=('x86_64')
url="https://hyprpanel.com/"
license=('MIT')
depends=(
    # official repository:
    'wireplumber'
    'libgtop'
    'bluez'
    'bluez-utils'
    'networkmanager'
    'dart-sass'
    'wl-clipboard'
    'upower'
    # aur:
    'aylurs-gtk-shell-git'
)
makedepends=(
    'meson'
    'unzip'
    'git'
)
optdepends=(
    'python: GPU usage tracking (NVidia only)'
    'python-gpustat: GPU usage tracking (NVidia only)'
    'pywal: Pywal hook for wallpapers'
    'pacman-contrib: Checking for pacman updates'
    'power-profiles-daemon: Switch power profiles'
    'swww: Setting wallpapers'
    'grimblast-git: For the snapshot shortcut'
    'brightnessctl: To control keyboard and screen brightness'
    'btop: To view system resource usage'
    'gpu-screen-recorder: To use the built in screen recorder'
    'hyprpicker: To use the preset color picker shortcut'
    'matugen-bin: To use wallpaper based color schemes'
)
source=('git+https://github.com/Jas-SinghFSU/HyprPanel.git#branch=master')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/HyprPanel"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/HyprPanel"
    arch-meson build
    meson compile -C build
}

package() {
    cd "$srcdir/HyprPanel"

    # install fonts
    install -dm755 "$pkgdir/usr/share/fonts/NFP"
    cp -r "$srcdir/HyprPanel/assets/fonts/"* "$pkgdir/usr/share/fonts/NFP/"
    fc-cache -fv

    # Install HyprPanel into /usr/local/share/HyprPanel
    meson install -C build --destdir "$pkgdir"

    # License
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
