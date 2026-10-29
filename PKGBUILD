# Maintainer: Tarek <tarekdshli@gmail.com>
# Based on the official Arch kdeconnect package (Antonio Rojas et al.)
#
# Daemon + CLI + plugins only: no KIO, Kirigami, KPeople, Qt Quick or the GUI apps.
# Intended for setups that drive kdeconnectd over D-Bus (e.g. a quickshell panel).
# Source is the fork: upstream's release tag plus the commits in `git log vX..minimal`.

pkgname=kdeconnect-minimal
pkgver=26.08.2
pkgrel=1
pkgdesc='KDE Connect daemon and CLI without KIO, Kirigami, Bluetooth or the GUI apps'
url='https://github.com/totti786/kdeconnect-minimal'
arch=(x86_64)
license=(GPL-2.0-or-later)
depends=(dbus
         glib2
         glibc
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kguiaddons
         ki18n
         knotifications
         kwindowsystem
         libei
         libstdc++
         libxkbcommon
         openssl
         pulseaudio-qt
         qt6-base
         solid
         wayland)
makedepends=(extra-cmake-modules
             git
             wayland-protocols)
optdepends=('sshfs: browse the phone filesystem (sftp plugin)')
provides=("kdeconnect=$pkgver")
conflicts=(kdeconnect)
source=("$pkgname::git+$url.git#tag=v$pkgver-minimal.$pkgrel")
sha256sums=('SKIP')

build() {
  cmake -B build -S $pkgname \
    -DBUILD_TESTING=OFF \
    -DWITH_X11=OFF \
    -DBLUETOOTH_ENABLED=OFF \
    -DINSTALL_UFW_APPLICATION_RULE=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname/LICENSES/*
}
