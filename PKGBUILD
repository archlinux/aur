# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>
# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=gnome-control-center-git
pkgver=3.35.91+3+ga80bbdf1a
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL2)
arch=(x86_64)
provides=(gnome-control-center)
conflicts=(gnome-control-center)
depends=(accountsservice cups-pk-helper gnome-bluetooth gnome-desktop
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas-git gtk3
         libgtop nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd grilo clutter-gtk libibus
         cheese-git libgudev bolt)
makedepends=(docbook-xsl modemmanager git python meson)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: Bluetooth and WebDAV file sharing'
            'rygel: media sharing'
            'vino: screen sharing'
            'openssh: remote login')
groups=(gnome)
source=("git+https://gitlab.gnome.org/GNOME/gnome-control-center.git"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd gnome-control-center
  git describe --tags | sed 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd gnome-control-center
  git submodule init
  git config --local submodule.subprojects/gvc.url "$srcdir/libgnome-volume-control"
  git submodule update
}


build() {
  arch-meson gnome-control-center build -D documentation=true
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
