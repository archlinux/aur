# Maintainer: callmetango
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alexey D. <lq07829icatm at rambler.ru>

pkgbase=sonic-workspace
pkgname=(sonic-workspace sonic-x11-session)
pkgver=6.7.3
pkgrel=2
pkgdesc='SonicDE workspace components'
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-workspace'
license=(LGPL-2.0-or-later)
depends=(accountsservice
         appstream-qt
         dbus
         fontconfig
         freetype2
         gcc-libs
         glibc
         icu
         kactivitymanagerd
         karchive
         kbookmarks
         kcmutils
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcrash
         kdbusaddons
         kde-cli-tools
         kdeclarative
         kded
         kholidays
         ki18n
         kiconthemes
         kidletime
         kio-fuse
         kirigami-addons
         kitemmodels
         kjobwidgets
         knewstuff
         knotifications
         kpackage
         kparts
         kpipewire
         kquickcharts
         kservice
         kstatusnotifieritem
         ksvg
         ksystemstats
         ktexteditor
         ktextwidgets
         kuserfeedback
         kwallet
         kwidgetsaddons
         kxmlgui
         libcanberra
         libice
         libkexiv2
         libqalculate
         libsm
         libx11
         libxau
         libxcb
         libxcrypt
         libxcursor
         libxfixes
         libxft
         libxtst
         milou
         ocean-sound-theme
         plasma-activities-stats
         prison
         qt6-5compat
         qt6-base
         qt6-declarative
         qt6-location
         qt6-positioning
         qt6-svg
         qt6-tools # for qdbus
         qt6-virtualkeyboard
         sh
         solid
         sonic-activities
         sonic-frameworks-auth
         sonic-frameworks-core-addons
         sonic-frameworks-gui-addons
         sonic-frameworks-io
         sonic-frameworks-io-extras
         sonic-frameworks-keybind
         sonic-frameworks-quick-ui
         sonic-frameworks-runner
         sonic-frameworks-windowsystem
         sonic-interface-libraries
         sonic-night-light
         sonic-screenlocker
         sonic-system-monitor-library
         sonic-win
         systemd-libs
         xcb-util
         xcb-util-cursor
         xcb-util-image
         xorg-xmessage
         xorg-xrdb
         zlib)
makedepends=(baloo
             networkmanager-qt
             qcoro
             sonic-frameworks-cmake-modules
             sonic-frameworks-doctools)
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7af9738eb5fd591e1aa17c751e39226760c4fd1f925faff5ec2e57590ca19a7d')

build() {
  cmake -B build -S $pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DGLIBC_LOCALE_GEN=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package_sonic-workspace() {
  optdepends=('appmenu-gtk-module: global menu support for some GTK3 applications'
            'baloo: Baloo search runner'
            'discover: manage applications installation from the launcher'
            'kdepim-addons: displaying PIM events in the calendar'
            'networkmanager-qt: IP based geolocation'
            'plasma-workspace-wallpapers: additional wallpapers'
            'plasma5-integration: use Plasma settings in Qt5 applications'
            'xdg-desktop-portal-gtk: sync font settings to Flatpak apps')
  depends+=(sonic-x11-session plasma-integration) # Declare runtime dependency here to avoid dependency cycles at build time
  provides=(plasma-workspace)
  conflicts=(plasma-workspace plasma-wayland-session)
  groups=(sonicde)

  DESTDIR="$pkgdir" cmake --install build

  rm -r "$pkgdir"/usr/share/xsessions/plasmax11.desktop
}

package_sonic-x11-session() {
  pkgdesc='SonicDE X11 session'
  depends=(sonic-workspace)
  provides=(plasma-x11-session)
  conflicts=(plasma-x11-session)
  groups=(sonicde)

  install -Dm644 build/login-sessions/plasmax11.desktop -t "$pkgdir"/usr/share/xsessions
}
