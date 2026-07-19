# Maintainer: Victor <victor.oliveira.egion@gmail.com>
pkgname=moon-profile-runner-git
pkgver=r74.3c0af0a
pkgrel=1
pkgdesc="Local daemon that detects the end of Apollo/Moonlight streaming sessions and controls the host display (MoonProfile)"
arch=('x86_64')
url="https://github.com/egionCode/moon_profile"
license=('GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
makedepends=('git' 'rust')
provides=('moon-profile-runner')
conflicts=('moon-profile-runner')
install=moon-profile-runner-git.install
source=("${pkgname%-git}::git+https://github.com/egionCode/moon_profile.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}/moon_profile_runner/src-tauri"
  cargo build --release --locked
}

package() {
  cd "$srcdir/${pkgname%-git}/moon_profile_runner/src-tauri"
  install -Dm755 "target/release/moon_profile_runner" "$pkgdir/usr/bin/moon-profile-runner"

  # Applications menu entry, so it can be launched by hand.
  install -Dm644 "../packaging/moon-profile-runner.desktop" \
    "$pkgdir/usr/share/applications/moon-profile-runner.desktop"
  sed -i "s|__EXEC_PATH__|/usr/bin/moon-profile-runner|" \
    "$pkgdir/usr/share/applications/moon-profile-runner.desktop"

  # systemd --user unit for autostart (WantedBy=graphical-session.target,
  # not a plain XDG autostart .desktop) - gets restart-on-failure and
  # journalctl logs. Verified on a real KDE Plasma 6 Wayland session that
  # graphical-session.target correctly imports WAYLAND_DISPLAY and
  # DBUS_SESSION_BUS_ADDRESS, so the tray/GUI shows up fine. Can't be
  # auto-enabled from here (pacman doesn't run as the logged-in user's
  # systemd --user instance) - see moon-profile-runner-git.install.
  install -Dm644 "../packaging/moon-profile-runner.service" \
    "$pkgdir/usr/lib/systemd/user/moon-profile-runner.service"

  install -Dm644 "../../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
