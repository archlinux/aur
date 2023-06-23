# Merged with official ABS plasma-workspace PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>

pkgbase=plasma-workspace-git
pkgname=(plasma-workspace-git plasma-wayland-session-git)
pkgver=5.27.80_r13935.g85014ec0a
pkgrel=1
pkgdesc='KDE Plasma Workspace'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
depends=(knotifyconfig-git libksysguard-git ktexteditor-git libqalculate kde-cli-tools-git appstream-qt phonon-qt6-git
         xorg-xrdb xorg-xsetroot kactivitymanagerd-git kholidays-git xorg-xmessage milou-git prison-git kwin-git
         plasma-integration-git kpeople-git kactivities-stats-git libkscreen-git kquickcharts-git kuserfeedback-git layer-shell-qt-git)
makedepends=(git extra-cmake-modules-git kdoctools-git gpsd baloo-git networkmanager-qt-git plasma-wayland-protocols-git plasma5support-git)
conflicts=(${pkgbase%-git})
provides=(${pkgbase%-git})
groups=(plasma-git)
source=("git+https://github.com/KDE/${pkgbase%-git}.git" kde.pam)
sha256sums=('SKIP'
            '00090291204baabe9d6857d3b1419832376dd2e279087d718b64792691e86739')

pkgver() {
  cd ${pkgbase%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgbase%-git} \
    -DQT_MAJOR_VERSION=6 \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package_plasma-workspace-git() {
  optdepends=('plasma-workspace-wallpapers-git: additional wallpapers'
              'gpsd: GPS based geolocation' 'networkmanager-qt: IP based geolocation'
              'kdepim-addons-git: displaying PIM events in the calendar'
              'appmenu-gtk-module: global menu support for GTK2 and some GTK3 applications'
              'qt6-virtualkeyboard: virtual keyboard support in lock screen'
              'baloo-git: Baloo search runner' 'discover: manage applications installation from the launcher')
  conflicts=(plasma-workspace)
  provides=(plasma-workspace notification-daemon)
  backup=('etc/pam.d/kde')

  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 "$srcdir"/kde.pam "$pkgdir"/etc/pam.d/kde

  # Split plasma-wayland scripts
  rm -r "$pkgdir"/usr/share/wayland-sessions
}

package_plasma-wayland-session-git() {
  pkgdesc='Plasma Wayland session'
  depends=(plasma-workspace-git qt6-wayland kwayland-integration-git xorg-server-xwayland)
  conflicts=(plasma-wayland-session)
  provides=(plasma-wayland-session)

  install -Dm644 build/login-sessions/plasmawayland.desktop "$pkgdir"/usr/share/wayland-sessions/plasmawayland.desktop
}
