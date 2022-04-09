# Maintainer: Vitaly Ankh <vitalyankh@gmail.com>
# Contributor: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

_pkgname=gnome-control-center-4
pkgname=$_pkgname-git
pkgver=42.0+38+gb213fdc28
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop"
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL2)
arch=(i686 pentium4 x86_64)
provides=(gnome-control-center)
depends=(accountsservice cups-pk-helper gnome-bluetooth-git gnome-desktop-4
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas-git gtk3
         libgtop libnma-git nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd libibus libcheese
         libgudev bolt udisks2 libhandy gsound colord-gtk4)
makedepends=(docbook-xsl modemmanager git python meson)
checkdepends=(python-dbusmock python-gobject xorg-server-xvfb)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login'
            'power-profiles-daemon: Power profiles support')
groups=(gnome)
source=("${_pkgname}::git+https://gitlab.gnome.org/GNOME/gnome-control-center.git"
        "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd "${_pkgname}"

  # Install bare logos into pixmaps, not icons
  sed -i "/install_dir/s/'icons'/'pixmaps'/" panels/info-overview/meson.build

  git submodule init subprojects/gvc
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git submodule update
}


build() {
  arch-meson "${_pkgname}" build -D documentation=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
