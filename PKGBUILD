# Maintainer: sfs sfslinux@gmail.com

pkgname=wayland-power-manager-git
pkgver=0.1.0.r0.g0000000
pkgrel=97
pkgdesc="GTK3 power manager frontend for labwc using swayidle/logind"
arch=('x86_64')
url="https://github.com/REPLACE_ME/wayland-power-manager"
license=('GPL-2.0-or-later')
install=wayland-power-manager.install
depends=('gtk3' 'glib2' 'systemd' 'swayidle' 'swaylock')
optdepends=('upower: preferred battery/AC detection source and battery events'
            'libnotify: desktop notifications for critical battery alerts'
            'wlopm: DPMS off/on control under labwc without swaymsg'
            'batticonplus-ayatana: tray battery monitor integration')
makedepends=('git' 'meson' 'ninja' 'gettext')
provides=('wayland-power-manager')
conflicts=('wayland-power-manager')
source=('git+https://github.com/sfs-pra/wayland-power-manager.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/wayland-power-manager"
  printf "%s.r%s.g%s" "0.1.0" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/wayland-power-manager"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  cd "$srcdir/wayland-power-manager"
  meson install -C build --destdir "$pkgdir"
  install -Dm644 data/systemd/user/swayidle.service "$pkgdir/usr/lib/systemd/user/swayidle.service"
  install -Dm644 data/systemd/user/wayland-powerd.service "$pkgdir/usr/lib/systemd/user/wayland-powerd.service"
  install -Dm644 data/systemd/user-preset/90-wayland-power-manager.preset "$pkgdir/usr/lib/systemd/user-preset/90-wayland-power-manager.preset"
  install -Dm755 data/batticonplus/wayland-batticonplus-launcher "$pkgdir/usr/bin/wayland-batticonplus-launcher"
  install -Dm644 data/autostart/wayland-power-manager-batticonplus.desktop "$pkgdir/etc/xdg/autostart/wayland-power-manager-batticonplus.desktop"
  install -Dm644 README.md "$pkgdir/usr/share/doc/wayland-power-manager/README.md"
  install -Dm644 README-ru.md "$pkgdir/usr/share/doc/wayland-power-manager/README-ru.md"
  install -Dm644 man/wayland-power-manager.1 "$pkgdir/usr/share/man/man1/wayland-power-manager.1"
  install -Dm644 man/wayland-powerd.1 "$pkgdir/usr/share/man/man1/wayland-powerd.1"
  install -Dm644 man/ru/wayland-power-manager.1 "$pkgdir/usr/share/man/ru/man1/wayland-power-manager.1"
  install -Dm644 man/ru/wayland-powerd.1 "$pkgdir/usr/share/man/ru/man1/wayland-powerd.1"
}
