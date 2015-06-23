# Contributor: Zeph <zeph33@gmail.com>
# Maintainer: Zeph <zeph33@gmail.com>

pkgname=pamac-aur
_pkgname=pamac
pkgver=2.3.3
_pkgver=2.3.3
pkgrel=2
# This is the release package so the below _gitcommit variable should (usually) be commented out.
#_gitcommit="d8e9826ab0b84bdb6f4b6c0dcc4ce1461bf04595"
pkgdesc="A Gtk3 frontend for libalpm"
arch=(any)
url="https://github.com/manjaro/pamac"
license=('GPL3')
depends=('glib2>=2.42' 'json-glib' 'libsoup' 'dbus-glib' 'polkit' 'yaourt' 'vte3>=0.38'
         'gtk3>=3.16' 'libnotify' 'desktop-file-utils' 'pacman>=4.2'
         'gnutls>=3.4')
optdepends=('polkit-gnome: needed for authentification in Cinnamon, Gnome'
            'lxsession: needed for authentification in Xfce, LXDE etc.')
makedepends=('gettext' 'itstool' 'vala>=0.28')
backup=('etc/pamac.conf')
provides=('pamac')
conflicts=('pamac')
options=(!emptydirs)
install=pamac.install

if [ "${_gitcommit}" != "" ]; then
  source=("pamac-$pkgver-$pkgrel.tar.gz::$url/archive/$_gitcommit.tar.gz")
else
  source=("pamac-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
fi

source+=("pamac-grid-row-resize.patch::https://github.com/manjaro/pamac/commit/07dc17b9709b272d1bcd2170e28c59495b2fa333.patch")

sha256sums=('5683a5e14ceedc83a4aa0c1415c75aeb65ba334923b34528fa5da2523ebb12e4'
            'afce6fdd69f57999fbf16e0777f0f9ca18fd2883953ff2d8a9730c49448975db')

prepare() {
  if [ "$_gitcommit" != "" ]; then
    mv "$srcdir/pamac-$_gitcommit" "$srcdir/pamac-$pkgver"
  fi

  # adjust version string
  cd "$srcdir/pamac-$pkgver/src"
  sed -i -e "s|\"$_pkgver\"|\"$pkgver-$pkgrel\"|g" manager_window.vala
  cd "$srcdir/pamac-$pkgver/"
  # patches here
  patch -Np1 -i $srcdir/pamac-grid-row-resize.patch
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
