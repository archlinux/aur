# Maintainer: Jason Scurtu <jscurtu@gmail.com>
# Contributor: Zeph <zeph33@gmail.com>

pkgname=pamac-patched-headerbar
pkgver=2.4.2
_pkgver=2.4.2
pkgrel=2
# This is the release package so the below _gitcommit variable should (usually) be commented out.
#_gitcommit="d8e9826ab0b84bdb6f4b6c0dcc4ce1461bf04595"
pkgdesc="A Gtk3 frontend for libalpm, patched by me to use GtkHeaderBar to match GNOME"
arch=('i686' 'x86_64')
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'vte3>=0.38' 'gtk3>=3.16'
         'libnotify' 'desktop-file-utils' 'pacman>=4.2' 'gnutls>=3.4')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.'
            'yaourt: needed for AUR support')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

if [ "${_gitcommit}" != "" ]; then
  source=("pamac-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz" headerbar.patch)
else
  source=("pamac-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz" headerbar.patch)
fi

sha256sums=('f74f7ac891e88802e9d1eb9b26e41f0d80704c890732b4001913455e7950504d'
            '90f117bac7160aeb9972faa2803367a4abce35cc7e356690d641f2123456eed3')

prepare() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/pamac-$_gitcommit" "$srcdir/pamac-$pkgver"
  fi

  # adjust version string
  cd "$srcdir/pamac-$pkgver/src"
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" manager_window.vala
  cd "$srcdir/pamac-$pkgver/"
  # patches here
  patch -p1 -i $srcdir/headerbar.patch
}

build() {
  cd "$srcdir/pamac-$pkgver"

  # build
  make all
}

package() {
  cd "$srcdir/pamac-$pkgver"

  mkdir -p "${pkgdir}/usr/share/icons/hicolor"
  cp -r "data/icons/"* "${pkgdir}/usr/share/icons/hicolor"
  cp -r "po/locale" "${pkgdir}/usr/share"
  install -Dm744 "src/pamac-daemon" "${pkgdir}/usr/bin/pamac-daemon"
  install -Dm755 "src/pamac-manager" "${pkgdir}/usr/bin/pamac-manager"
  install -Dm755 "src/pamac-updater" "${pkgdir}/usr/bin/pamac-updater"
  install -Dm755 "src/pamac-tray" "${pkgdir}/usr/bin/pamac-tray"
  install -Dm755 "src/pamac-refresh" "${pkgdir}/usr/bin/pamac-refresh"
  install -Dm755 "src/pamac-install" "${pkgdir}/usr/bin/pamac-install"
  install -Dm644 "data/applications/pamac-tray.desktop" "${pkgdir}/etc/xdg/autostart/pamac-tray.desktop"
  install -Dm644 "data/applications/pamac-manager.desktop" "${pkgdir}/usr/share/applications/pamac-manager.desktop"
  install -Dm644 "data/applications/pamac-updater.desktop" "${pkgdir}/usr/share/applications/pamac-updater.desktop"
  install -Dm644 "data/applications/pamac-install.desktop" "${pkgdir}/usr/share/applications/pamac-install.desktop"
  install -Dm644 "data/config/pamac.conf" "${pkgdir}/etc/pamac.conf"
  install -Dm644 "data/dbus/org.manjaro.pamac.conf" "${pkgdir}/etc/dbus-1/system.d/org.manjaro.pamac.conf"
  install -Dm644 "data/dbus/org.manjaro.pamac.service" "${pkgdir}/usr/share/dbus-1/system-services/org.manjaro.pamac.service"
  install -Dm644 "data/systemd/pamac.service" "${pkgdir}/usr/lib/systemd/system/pamac.service"
  install -Dm744 "data/networkmanager/99_update_pamac_tray" "${pkgdir}/etc/NetworkManager/dispatcher.d/99_update_pamac_tray"
  install -Dm644 "data/polkit/org.manjaro.pamac.policy" "${pkgdir}/usr/share/polkit-1/actions/org.manjaro.pamac.policy"
  install -Dm644 "data/mime/x-alpm-package.xml" "${pkgdir}/usr/share/mime/packages/x-alpm-package.xml"
}

# vim:set ts=2 sw=2 et:
