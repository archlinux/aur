# Maintainer: ramisotti13-eng
pkgname=basecamp-linux
pkgver=4.0.0
pkgrel=1
pkgdesc="Unofficial Linux companion app for Mountain peripherals (Everest Max/60 keyboards, Makalu 67/Max mouse, DisplayPad)"
arch=('x86_64')
url="https://github.com/ramisotti13-eng/BaseCamp-Linux"
license=('GPL3')
# The package is the AppImage, and the AppImage brings everything Python
# itself, the web interface's window included (pywebview with Qt WebEngine,
# 4.0 on), so no python-* package is needed here. What it takes from the
# system: FUSE to mount itself, and the graphics stack Qt WebEngine draws
# with (libGL/libEGL from libglvnd, libgbm from mesa), which an AppImage
# never carries because it belongs to the graphics driver. A source install
# uses Arch's own packages instead (README: python-pywebview, python-gobject,
# webkit2gtk-4.1).
depends=('fuse2' 'libglvnd' 'mesa')
optdepends=('xdotool: keypress/text actions on X11'
            'ydotool: keypress/text actions on Wayland'
            'zenity: native file picker on GNOME and other non-KDE desktops'
            'kdialog: native file picker on KDE'
            'playerctl: required by the Now Playing plugin (MPRIS media control)'
            'libpulse: per-app volume and mute via pactl (Now Playing plugin)')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/ramisotti13-eng/BaseCamp-Linux/releases/download/v${pkgver}/BaseCamp-Linux-${pkgver}-x86_64.AppImage"
        "99-mountain.rules::https://raw.githubusercontent.com/ramisotti13-eng/BaseCamp-Linux/v${pkgver}/99-mountain.rules"
        "app_icon_256.png::https://raw.githubusercontent.com/ramisotti13-eng/BaseCamp-Linux/v${pkgver}/resources/app_icon_256.png"
        "basecamp-linux.desktop"
        "basecamp-linux.sh")
sha256sums=('4d9a56802dd5cbc82c0b8f58c040777a96fea375c9f37e3edf13bcb62d9e79d9'
            'SKIP'
            'SKIP'
            'SKIP'
            'ca5e538dea94f775584c1074551b5c878f8f28331a0b11f90ddb61b298728046')
options=(!strip)

package() {
    # Install the AppImage, started through a wrapper that points its
    # bundled OpenSSL at Arch's certificates (no HTTPS without it)
    install -Dm755 "${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/basecamp-linux/basecamp-linux.AppImage"
    install -Dm755 "basecamp-linux.sh" "${pkgdir}/usr/bin/basecamp-linux"

    # Install udev rule
    install -Dm644 "99-mountain.rules" \
        "${pkgdir}/usr/lib/udev/rules.d/99-mountain.rules"

    # Install icon
    install -Dm644 "app_icon_256.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/basecamp-linux.png"

    # Install desktop entry
    install -Dm644 "basecamp-linux.desktop" \
        "${pkgdir}/usr/share/applications/basecamp-linux.desktop"
}
