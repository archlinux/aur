# Maintainer: Ossian Winter <ossian@winter.vg>

pkgname=sway-ow
pkgver=1.12.r7608.62b4e8e
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager'
arch=(x86_64)
url='https://github.com/ossianwinter/sway'
license=(MIT)
depends=(
  'cairo'
  'gdk-pixbuf2'
  'libevdev.so'
  'libinput'
  'libjson-c.so'
  'libpixman-1.so'
  'libudev.so'
  'libwayland-server.so'
  'libxcb'
  'libxkbcommon.so'
  'pango'
  'pcre2'
  'ttf-font'
  'wlroots-git'
  'xcb-util-wm'
)
makedepends=(git meson ninja scdoc wayland-protocols)
provides=("${pkgname%-ow}" 'wayland-compositor')
conflicts=("${pkgname%-ow}")
backup=(
  etc/sway/config
  etc/sway/config.d/50-systemd-user.conf
)
optdepends=(
  'brightnessctl: Brightness adjustment tool used in the default configuration'
  'foot: Terminal emulator used in the default configuration'
  'grim: Screenshot utility used in the default configuration'
  'i3status: Status line generation'
  'libpulse: Volume adjustment tool (pactl) used in the default configuration'
  'mako: Lightweight notification daemon'
  'polkit: System privilege control. Required if not using seatd service'
  'swaybg: Wallpaper tool for sway'
  'sway-contrib: Collection of user-contributed scripts for sway'
  'swayidle: Idle management daemon'
  'swaylock: Screen locker'
  'waybar: Highly customizable bar'
  'wmenu: Application launcher used in default config'
  'xorg-xwayland: X11 support'
  'xdg-desktop-portal-gtk: Default xdg-desktop-portal for file picking'
  'xdg-desktop-portal-wlr: xdg-desktop-portal backend'
)
source=("${pkgname}::git+${url}.git"
        "50-systemd-user.conf"
        "sway-portals.conf")
install="${pkgname}.install"
sha512sums=('SKIP'
            'd5f9aadbb4bbef067c31d4c8c14dad220eb6f3e559e9157e20e1e3d47faf2f77b9a15e52519c3ffc53dc8a5202cb28757b81a4b3b0cc5dd50a4ddc49e03fe06e'
            '4f9576b7218aef8152eb60e646985e96b13540b7a4fd34ba68fdc490199cf7a7b46bbee85587e41bffe81fc730222cf408d5712e6251edc85a0a0b0408c1a2df')

_meson_setup() {
  arch-meson "${pkgname}" "$1" -D sd-bus-provider=libsystemd
}

prepare() {
  _meson_setup build-pkgver
}

pkgver() {
  (
     set -o pipefail
     meson introspect --projectinfo build-pkgver | sed -n 's/.*"version": "\([^"]*\)".*/\1/;s/-\(dev\|rc[0-9]\+\)//p' | tr -d '\n'
  )
  cd "${pkgname}"
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  _meson_setup build
  meson compile -C build  
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 50-systemd-user.conf -t "${pkgdir}/etc/sway/config.d/"
  install -Dm644 sway-portals.conf -t "${pkgdir}/usr/share/xdg-desktop-portal/"
}
