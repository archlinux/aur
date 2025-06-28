# Maintainer: Erik Reider <erik.reider@protonmail.com>
pkgname="swayfx"
pkgver=0.5.3
pkgrel=4
license=("MIT")
pkgdesc="SwayFX: Sway, but with eye candy!"
makedepends=(
        "git"
        "meson"
        "scdoc"
        "wayland-protocols"
)
depends=(
        "cairo"
        "gdk-pixbuf2"
        "libevdev.so"
        "libinput"
        "libjson-c.so"
        "libudev.so"
        "libwayland-server.so"
        "libxcb"
        "libxkbcommon.so"
        "pango"
        "pcre2"
        "scenefx0.4"
        "ttf-font"
        "wlroots0.19"
)
optdepends=(
        "brightnessctl: Brightness adjustment tool used in the default configuration"
        "foot: Terminal emulator used in the default configuration"
        "i3status: Status line generation"
        "libpulse: Volume adjustment tool (pactl) used in the default configuration"
        "mako: Lightweight notification daemon"
        "polkit: System privilege control. Required if not using seatd service"
        "swaybg: Wallpaper tool for sway"
        "sway-contrib: Collection of user-contributed scripts for sway"
        "swayidle: Idle management daemon"
        "swaylock: Screen locker"
        "waybar: Highly customizable bar"
        "wmenu: Application launcher used in default config"
        "xorg-xwayland: X11 support"
        "xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking"
        "xdg-desktop-portal-wlr: xdg-desktop-portal backend"
)
backup=(etc/sway/config)
arch=("i686" "x86_64")
url="https://github.com/WillPower3309/swayfx"
source=("swayfx-${pkgver}.tar.gz::${url}/archive/refs/tags/$pkgver.tar.gz"
        50-systemd-user.conf
        sway-portals.conf)
sha512sums=(
        "SKIP"
        "d5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e"
        "790741df028822bf4d83170dea57e1c63f7d7938cf31969e4cd347b0fc07330322b603c9ec0091b7a3f425132bed9dee6f261074cc273555120858beaaaf5da1")
provides=("sway" "swayfx" "wayland-compositor")
conflicts=("sway" "swayfx" "swayfx-git")
install=sway.install

build() {
        arch-meson \
                -Dwerror=false \
                -Dsd-bus-provider=libsystemd \
                "swayfx-${pkgver}" build
        meson compile -C build
}

package() {
        install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
        install -Dm644 sway-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/sway-portals.conf"

        DESTDIR="$pkgdir" meson install -C build

        cd "swayfx-${pkgver}"
        install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
