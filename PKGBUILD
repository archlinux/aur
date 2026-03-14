# Maintainer: schlndh <schlindenbuch.h@seznam.cz>
pkgbase=plasma-workspace-povd
_pkgname=(plasma-workspace plasma-x11-session)
pkgname=(plasma-workspace-povd plasma-x11-session-povd)
pkgver=6.6.2
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=2
pkgdesc='KDE Plasma Workspace (patched for per-output virtual desktops)'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
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
         kauth
         kbookmarks
         kcmutils
         kcolorscheme
         kcompletion
         kconfig
         kconfigwidgets
         kcoreaddons
         kcrash
         kde-cli-tools
         kdeclarative
         kded
         kdbusaddons
         kglobalaccel
         kguiaddons
         kholidays
         ki18n
         kiconthemes
         kidletime
         kio
         kio-extras
         kio-fuse
         kirigami
         kirigami-addons
         kitemmodels
         kjobwidgets
         knewstuff
         knighttime
         knotifications
         kpackage
         kparts
         kpipewire
         krunner
         kquickcharts
         kscreenlocker
         kservice
         kstatusnotifieritem
         ksvg
         ksystemstats
         ktexteditor
         ktextwidgets
         kuserfeedback
         kwallet
         kwayland
         kwidgetsaddons
         kwin-povd
         kwindowsystem
         kxmlgui
         layer-shell-qt
         libcanberra
         libice
         libkexiv2
         libksysguard
         'libplasma<6.6.80'
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
         plasma-activities
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
         systemd-libs
         wayland
         xcb-util
         xcb-util-cursor
         xcb-util-image
         xorg-xmessage
         xorg-xrdb
         xorg-xwayland
         zlib)
makedepends=(baloo
             extra-cmake-modules
             kdoctools
             networkmanager-qt
             plasma-wayland-protocols-povd
             qcoro)
groups=(plasma)
source=(https://download.kde.org/stable/plasma/$_dirver/$_pkgname-$pkgver.tar.xz{,.sig}
        https://invent.kde.org/plasma/plasma-workspace/-/commit/9114115f.patch
        povd.patch)
sha256sums=('26302234542ae2c8286727895997c8e22652e90e92febb60e3ce975194e0cacd'
            'SKIP'
            '40d0aa1d4691ae8f59772d9014bd6f8650f9f18c74cbffdc50e7ec2e02313412'
            'fc27ea08b72682c1904dc9dc37a28f8358f9dd32e982dd7abd204d5cfff9d1a6')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

prepare() {
  patch -d $_pkgname-$pkgver -p1 < 9114115f.patch # Fix race
  sed -e 's/NotifyConfig//' -i $_pkgname-$pkgver/CMakeLists.txt
  cd "$_pkgname-$pkgver"
  patch -p1 < "$srcdir/povd.patch"
}

build() {
  cmake -B build -S $_pkgname-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DGLIBC_LOCALE_GEN=OFF \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package_plasma-workspace-povd() {
  optdepends=('appmenu-gtk-module: global menu support for some GTK3 applications'
            'baloo: Baloo search runner'
            'discover: manage applications installation from the launcher'
            'kdepim-addons: displaying PIM events in the calendar'
            'kwayland-integration: Wayland integration for Qt5 applications'
            'kwin-x11: X session window manager'
            'networkmanager-qt: IP based geolocation'
            'plasma-workspace-wallpapers: additional wallpapers'
            'plasma5-integration: use Plasma settings in Qt5 applications'
            'xdg-desktop-portal-gtk: sync font settings to Flatpak apps')
  depends+=(plasma-integration) # Declare runtime dependency here to avoid dependency cycles at build time
  conflicts=(plasma-wayland-session plasma-workspace)
  provides=(plasma-workspace)
  replaces=(plasma-wayland-session)

  DESTDIR="$pkgdir" cmake --install build

  rm -r "$pkgdir"/usr/share/xsessions/plasmax11.desktop
}


package_plasma-x11-session-povd() {
  pkgdesc='Plasma X11 session'
  depends=(plasma-workspace-povd kwin-x11)
  groups=()
  conflicts=(plasma-x11-session)
  provides=(plasma-x11-session)

  install -Dm644 build/login-sessions/plasmax11.desktop -t "$pkgdir"/usr/share/xsessions
}
