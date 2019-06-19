# Maintainer: Alberto Casademunt <alberto.casademunt at protonmail dot ch>

pkgname=gnome-control-center-nocheese
pkgver=3.32.2
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop."
url="https://gitlab.gnome.org/GNOME/gnome-control-center"
license=(GPL2)
arch=(x86_64)
provides=(gnome-control-center)
conflicts=(gnome-control-center)
depends=(accountsservice cups-pk-helper gnome-bluetooth gnome-desktop
         gnome-online-accounts gnome-settings-daemon gsettings-desktop-schemas gtk3
         libgtop nm-connection-editor sound-theme-freedesktop upower libpwquality
         gnome-color-manager smbclient libmm-glib libgnomekbd grilo libibus
         libgudev bolt udisks2 libhandy gsound)
makedepends=(docbook-xsl modemmanager git python meson)
checkdepends=(python-dbusmock python-gobject xorg-server-xvfb)
optdepends=('system-config-printer: Printer settings'
            'gnome-user-share: Bluetooth and WebDAV file sharing'
            'gnome-remote-desktop: screen sharing'
            'rygel: media sharing'
            'openssh: remote login')
groups=(gnome)
_commit=b3a3c544b37e6c355d94e13069fd86e3978a417d  # gnome-3-32
source=("git+https://gitlab.gnome.org/GNOME/gnome-control-center.git#commit=$_commit"
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

  # Fixup missing tag
  git tag -f 3.32.2 b3a3c544b37e6c355d94e13069fd86e3978a417d
}

build() {
  arch-meson gnome-control-center build -D documentation=true -Dcheese=false
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}