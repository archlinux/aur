# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=sway-git
pkgver=1.9.r7273.a4e8533
pkgrel=1
pkgdesc='Tiling Wayland compositor and replacement for the i3 window manager (git development version)'
arch=('x86_64')
url="https://github.com/swaywm/sway"
license=("MIT")
depends=(
"cairo"
"gdk-pixbuf2"
"glib2"
"glibc"
"json-c"
"libdrm"
"libevdev"
"libinput"
"libxcb"
"libxkbcommon"
"pango"
"pcre2"
"pixman"
"systemd-libs"
"wayland"
"wlroots-git"
"xcb-util-wm"
)
makedepends=(
"git"
"libcap"
"meson"
"scdoc"
"wayland-protocols"
)
optdepends=(
'wmenu: Application launcher used in default configuration'
'foot: Terminal emulator used in default configuration'
'polkit: System privilege control. Required if not using seatd service'
'swaybg: Wallpaper tool for sway'
'swayidle: Idle management daemon'
'swaylock: Screen locker'
'xorg-xwayland: X11 support'
'xdg-desktop-portal-gtk: Portal used for default file picking'
'xdg-desktop-portal-wlr: Portal used for screen sharing'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install="${pkgname}.install"
source=("${pkgname}::git+${url}.git"
"50-systemd-user.conf"
"sway-portals.conf")
b2sums=('SKIP'
        '71f45f9abb4e9f98a52177b227aa30ab27d02c9eef8a31400460e71c72b6d40ec396581f0b1703d4cec655aaba704077212882f643c6efb6cda951ea69b5383d'
        'cdba5fd2988b7ead8b264d5b41f1c7adb47a6487be1e3a4ce98c0af2094d9964f4bc364237c4437014be18061f067aa741b0382f21365be497e06b189c5c7728')

_meson_setup() {
  arch-meson "$pkgname" "$1" -D sd-bus-provider=libsystemd
}

prepare() {
  _meson_setup build-pkgver
}

pkgver() {
  (
    set -o pipefail
    meson introspect --projectinfo build-pkgver | sed -n 's/.*"version": "\([^"]*\)".*/\1/;s/-dev//p' | tr -d '\n'
  )
  cd "$pkgname"
  printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  _meson_setup build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal/"
}
