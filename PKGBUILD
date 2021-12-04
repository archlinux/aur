# Maintainer: Fabian Bornschein <fabiscafe-cat-mailbox-dog-org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-control-center-oldstable
pkgver=40.7
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop (oldstable version)"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
conflicts=("gnome-control-center")
provides=("gnome-control-center=$pkgver")
replaces=("gnome-control-center")
license=(GPL2)
arch=(x86_64)
depends=(accountsservice cups-pk-helper gnome-bluetooth gnome-desktop
         gnome-online-accounts gnome-settings-daemon-oldstable gsettings-desktop-schemas-oldstable gtk3
         libgtop nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd grilo libibus
         libcheese libgudev bolt udisks2 libhandy gsound colord-gtk)
makedepends=(docbook-xsl modemmanager git python meson)
checkdepends=(python-dbusmock python-gobject xorg-server-xvfb)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login')
groups=(gnome-oldstable)
_commit=aa721dc9ac2eae7c81e0c339cebb878201acbbc0  # tags/40.7^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gnome-control-center
  git describe --tags | sed 's/_/./g;s/-/+/g'
}

prepare() {
  cd gnome-control-center
  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
}


build() {
  arch-meson gnome-control-center build -D documentation=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
