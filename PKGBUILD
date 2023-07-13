# Maintainer: Melvyn <melvyn2@brcok.tk>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Corrado Primier <bardo@aur.archlinux.org>

pkgname=rtkit-suspend-fix-git
conflicts=("rtkit")
provides=("rtkit")
pkgver=r126.dd8e5e9
pkgrel=1
pkgdesc="Realtime Policy and Watchdog Daemon, with watchdog-ignore on suspend"
url="https://github.com/jmerdich/rtkit/tree/jmerdich/suspend-is-not-deadlock"
arch=(x86_64)
license=(GPL3 custom:BSD)
depends=(dbus polkit systemd)
makedepends=(git meson vim)
source=("git+https://github.com/jmerdich/rtkit#branch=jmerdich/suspend-is-not-deadlock")
sha256sums=('SKIP')

pkgver() {
  cd rtkit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd rtkit
}

build() {
  arch-meson rtkit build -D installed_tests=false
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"

  echo 'u rtkit 133 "RealtimeKit" /proc' |
    install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/rtkit.conf"

  install -Dt "$pkgdir/usr/share/licenses/$pkgname" -m644 rtkit/LICENSE
  sed -ne '4,25p' rtkit/rtkit.c |
    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
