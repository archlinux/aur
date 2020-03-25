# Maintainer: Dustin Falgout <dustin@falgout.us>
# Contributor: Guillaume Benoit <guillaume@manjaro.org>
# Contributor: Philip Müller <philm@manjaro.org>
# Contributor: Helmut Stult <helmut@manjaro.org>

pkgbase=pamac
pkgname=('pamac-common' 'pamac-cli-src' 'pamac-gtk' 'pamac-tray-appindicator-src')
_pkgver=9.4.0
pkgver=9.4.0
pkgrel=3
_commit=bccd744b7d2cb8b81021993d4f57388d9fa338b9
pkgdesc="A Package Manager based on libalpm with AUR and Appstream support"
arch=('x86_64')
url="https://gitlab.manjaro.org/applications/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3'
         'desktop-file-utils' 'pacman>=5.2' 'pacman<5.3' 'gnutls>=3.4' 'libnotify'
         'appstream-glib' 'archlinux-appstream-data' 'git')
makedepends=('gettext' 'meson' 'vala>=0.46.0' 'libappindicator-gtk3' 'gobject-introspection'
             'gtk3>=3.22')
options=(!emptydirs)

source=("pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/$_commit/$pkgname-$_commit.tar.gz")
        #"pamac-$pkgver-$pkgrel.tar.gz::$url/-/archive/v$pkgver/pamac-v$pkgver.tar.gz")
sha256sums=('8a3ffb6cab34614250a28505f7c3c6bd15862c90691287ea2363ece14ba7e2e8')

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
  meson --prefix=/usr \
        --sysconfdir=/etc \
        -Denable-appindicator=true \
        -Denable-snap=false \
        -Denable-flatpak=false \
        --buildtype=debug

  # build
  ninja
}

package_pamac-common() {
  optdepends=('pamac-snap-plugin' 'pamac-flatpak-plugin')
  backup=('etc/pamac.conf')
  provides=("pamac-common=$pkgver-$pkgrel")
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
  provides=("pamac-cli=$pkgver-$pkgrel")
  conflicts=('pamac<=7.3.4-2' 'pamac-aur' 'pamac-cli-dev')
  cd "$srcdir/pamac-v$_pkgver"
  install -Dm755 "builddir/src/pamac" "$pkgdir/usr/bin/pamac"
}

package_pamac-gtk() {
  depends=('pamac-cli-src' 'gtk3>=3.22')
  provides=("pamac=$pkgver-$pkgrel" "pamac-gtk=$pkgver-$pkgrel")
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
  pkgdesc="Tray icon for better integration of pamac-gtk in KDE"
  depends=('pamac-gtk' 'libappindicator-gtk3')
  provides=("pamac-tray-appindicator-src=$pkgver-$pkgrel")
  conflicts=('pamac-tray-appindicator-dev')
  cd "$srcdir/pamac-v$_pkgver"
  install -Dm755 "builddir/src/pamac-tray-appindicator" "$pkgdir/usr/bin/pamac-tray-appindicator"
  install -Dm644 "data/applications/pamac-tray-appindicator.desktop" "$pkgdir/etc/xdg/autostart/pamac-tray-appindicator.desktop"
}
