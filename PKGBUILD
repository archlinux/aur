# Maintainer: GreyXor <greyxor@protonmail.com>
# Contributor: Drew DeVault <sir@cmpwn.com>
pkgname=sway-git
pkgver=1.6.rc2.r584.g0aceff74
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
source=("${pkgname}::git+${url}.git"
"50-systemd-user.conf"
"sway-portals.conf")
b2sums=('SKIP'
        '71f45f9abb4e9f98a52177b227aa30ab27d02c9eef8a31400460e71c72b6d40ec396581f0b1703d4cec655aaba704077212882f643c6efb6cda951ea69b5383d'
        'eeaa6bdfae0fa6c0445d7d02209ef9142d529f1770fd8d9d614772c276ffa7461247523399164fed70ad39b25af9a91fcf8afa23af5c193c898c44487956de7f')

pkgver() {
  cd "$pkgname"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "$pkgname" build -D sd-bus-provider=libsystemd
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 50-systemd-user.conf -t "$pkgdir/etc/sway/config.d/"
  install -Dm644 sway-portals.conf -t "$pkgdir/usr/share/xdg-desktop-portal/"
}
