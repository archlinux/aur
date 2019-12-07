# Maintainer: Dustin Falgout <dustin@falgout.us>
# Contributor: Guillaume Benoit <guillaume@manjaro.org>
# Contributor: Philip Müller <philm@manjaro.org>
# Contributor: Helmut Stult <helmut@manjaro.org>

pkgbase=pamac
pkgname=('pamac-common' 'pamac-cli-src' 'pamac-gtk' 'pamac-tray-appindicator-src')
_pkgver=9.2.0rc
pkgver=9.2.0rc
pkgrel=3
_commit=a0c655ab4edaf8f83a13f993c4a6678a55251f38
pkgdesc="A Package Manager based on libalpm with AUR and Appstream support"
arch=('x86_64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3'
         'desktop-file-utils' 'pacman>=5.2' 'pacman<5.3' 'gnutls>=3.4' 'libnotify'
         'appstream-glib' 'archlinux-appstream-data' 'git')
makedepends=('gettext' 'meson' 'vala>=0.36.6' 'libappindicator-gtk3' 'gobject-introspection'
             'gtk3>=3.22')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")
        #"pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.gz")
sha256sums=('db43c094229688fa20231941838b22ecf6f96375e0f7e3e9e46071630d3ab27b')

prepare() {
  mv "$srcdir/pamac-$_commit" "$srcdir/pamac-v$_pkgver"
  cd "$srcdir/pamac-v$_pkgver"
  # patches here

  # adjust version string
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" src/version.vala
}

build() {
  cd "$srcdir/pamac-v$_pkgver"
  mkdir -p builddir
  cd builddir
  meson --prefix=/usr --sysconfdir=/etc -Denable-appindicator=true -Denable-snap=false --buildtype=debug

  # build
  ninja
}

package_pamac-common() {
  depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3'
         'desktop-file-utils' 'pacman>=5.2' 'pacman<5.3' 'gnutls>=3.4' 'libnotify'
         'appstream-glib' 'archlinux-appstream-data' 'git')
  optdepends=()
  backup=('etc/pamac.conf')
  conflicts=('pamac<=7.3.4-2' 'pamac-aur' 'pamac-common-dev')
  install=pamac-common.install
  cd "$srcdir/pamac-v$_pkgver"
  cd builddir
  DESTDIR="$pkgdir" ninja install
  # remove pamac-cli
  rm "$pkgdir/usr/bin/pamac"
  # remove pamac-tray-appindicator
  rm "$pkgdir/usr/bin/pamac-tray-appindicator"
  rm "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
  # remove pamac-tray
  rm "$pkgdir/usr/bin/pamac-tray"
  rm "$pkgdir/etc/xdg/autostart/pamac-tray.desktop"
  # remove pamac-gtk
  rm "$pkgdir/usr/share/vala/vapi/pamac-gtk.vapi"
  rm "$pkgdir/usr/include/pamac-gtk.h"
  rm "$pkgdir/usr/lib/libpamac-gtk.so"
  rm "$pkgdir/usr/bin/pamac-installer"
  rm "$pkgdir/usr/bin/pamac-manager"
  rm -rf "$pkgdir/usr/share/applications"
  rm "$pkgdir/usr/share/dbus-1/services/org.manjaro.pamac.manager.service"
  rm -rf "$pkgdir/usr/share/gnome-shell"
}

package_pamac-cli-src() {
  depends=('pamac-common')
  conflicts=('pamac<=7.3.4-2' 'pamac-aur' 'pamac-cli-dev')
  cd "$srcdir/pamac-v$_pkgver"
  install -Dm755 "builddir/src/pamac" "$pkgdir/usr/bin/pamac"
}

package_pamac-gtk() {
  depends=('pamac-cli-src' 'gtk3>=3.22' 'pamac-tray-appindicator-src')
  provides=("pamac=$pkgver-$pkgrel")
  replaces=('pamac')
  conflicts=('pamac' 'pamac-aur' 'pamac-gtk-dev')
  install=pamac-gtk.install
  cd "$srcdir/pamac-v$_pkgver"
  install -Dm755 "builddir/src/pamac-tray" "$pkgdir/usr/bin/pamac-tray"
  install -Dm644 "data/applications/pamac-tray.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray.desktop"
  install -Dm644 "builddir/src/pamac-gtk.vapi" "$pkgdir/usr/share/vala/vapi/pamac-gtk.vapi"
  install -Dm644 "builddir/src/pamac-gtk.h" "$pkgdir/usr/include/pamac-gtk.h"
  install -Dm755 "builddir/src/libpamac-gtk.so" "$pkgdir/usr/lib/libpamac-gtk.so"
  install -Dm755 "builddir/src/pamac-installer"  "$pkgdir/usr/bin/pamac-installer"
  install -Dm755 "builddir/src/pamac-manager"  "$pkgdir/usr/bin/pamac-manager"
  install -Dm644 "data/applications/org.manjaro.pamac.manager.desktop" "$pkgdir/usr/share/applications/org.manjaro.pamac.manager.desktop"
  install -Dm644 "data/applications/pamac-installer.desktop" "$pkgdir/usr/share/applications/pamac-installer.desktop"
  install -Dm644 "data/applications/pamac-manager.desktop" "$pkgdir/usr/share/applications/pamac-manager.desktop"
  install -Dm644 "data/applications/pamac-updater.desktop" "$pkgdir/usr/share/applications/pamac-updater.desktop"
  install -Dm644 "builddir/data/dbus/org.manjaro.pamac.manager.service" "$pkgdir/usr/share/dbus-1/services/org.manjaro.pamac.manager.service"
  install -Dm644 "data/gnome-shell/org.manjaro.pamac.manager.search-provider.ini" "$pkgdir/usr/share/gnome-shell/search-providers/org.manjaro.pamac.manager.search-provider.ini"
  mkdir -p "$pkgdir/usr/share/gnome-shell/extensions"
  cp -r "data/gnome-shell/pamac-updates@manjaro.org" "$pkgdir/usr/share/gnome-shell/extensions"
}

package_pamac-tray-appindicator-src() {
  pkgdesc="Tray icon using appindicator which fits better in KDE"
  depends=('pamac-gtk' 'libappindicator-gtk3')
  conflicts=('pamac-tray-appindicator-dev' 'pamac-tray-appindicator-git')
  cd "$srcdir/pamac-v$_pkgver"
  install -Dm755 "builddir/src/pamac-tray-appindicator" "$pkgdir/usr/bin/pamac-tray-appindicator"
  install -Dm644 "data/applications/pamac-tray-appindicator.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
}
