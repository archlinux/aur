# Maintainer: Nils Bars <nils.bars@rub.de>
pkgname=flameshot-sway-git
_pkgname=flameshot-sway
pkgver=r2181.4b2a68bb
pkgrel=1
pkgdesc="Powerful yet simple to use screenshot software with improved Wayland/Sway multi-monitor support"
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
url="https://github.com/nbars/flameshot-sway"
license=('GPL-3.0-or-later')
depends=('qt6-base' 'qt6-svg' 'hicolor-icon-theme' 'kguiaddons' 'kdsingleapplication' 'layer-shell-qt')
makedepends=('git' 'qt6-tools' 'cmake' 'ninja')
optdepends=('xdg-desktop-portal: For portal-based screenshot on Wayland'
            'xdg-desktop-portal-wlr: For Sway, Hyprland, and wlroots compositors'
            'xdg-desktop-portal-kde: For KDE Plasma'
            'grim: Required for Sway, Hyprland, and wlroots screenshot capture'
            'gnome-shell-extension-appindicator: For system tray icon on GNOME'
            'qt6-imageformats: For additional export image formats (e.g. tiff, webp, and more)'
           )
provides=(flameshot)
conflicts=(flameshot flameshot-git)
source=("git+https://github.com/nbars/flameshot-sway.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"

    cmake -GNinja -B build -S . \
          -DCMAKE_BUILD_TYPE=None \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DUSE_WAYLAND_CLIPBOARD=1 \
          -DUSE_LAYER_SHELL_QT=1 \
          -DDISABLE_UPDATE_CHECKER=1 \
          -DUSE_BUNDLED_KDSINGLEAPPLICATION=0

    cmake --build build
}

package() {
    cd "${srcdir}/${_pkgname}"

    DESTDIR="${pkgdir}" cmake --install build
}
