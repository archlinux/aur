# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>


_pkgbase=gnome-software
pkgbase=gnome-software-snap
pkgname=(gnome-software-snap gnome-software-packagekit-plugin-snap)
pkgver=3.30.2
pkgrel=1
pkgdesc="GNOME Software Tools with built in snap support"
url="https://wiki.gnome.org/Apps/Software/"
arch=(x86_64)
license=(GPL2)
makedepends=(appstream-glib gnome-desktop libpackagekit-glib flatpak fwupd ostree
             docbook-xsl git gobject-introspection gspell gtk-doc meson valgrind snapd-glib)
source=("$_pkgbase-$pkgver.tar.gz::https://gitlab.gnome.org/GNOME/gnome-software/-/archive/$pkgver/gnome-software-$pkgver.tar.gz")
sha256sums=('b709a4408da8225d982751f13c4e3ada2dfd453a4ccdd01f0da3040d4de3d542')



prepare() {
  cd $_pkgbase-$pkgver
}

build() {
  arch-meson $_pkgbase-$pkgver build \
    -D ubuntuone=true \
    -D ubuntu_reviews=true \
    -D snap=true
  ninja -C build
}

check() {
  # build container troubles
  meson test -C build || :
}

package_gnome-software-snap() {
  groups=('gnome')
  conflicts=(gnome-software)
  provides=(gnome-software)
  depends=(appstream-glib gnome-desktop gsettings-desktop-schemas gspell libpackagekit-glib gnome-software-packagekit-plugin-snap snapd)
  optdepends=('flatpak: Flatpak support plugin'
              'fwupd: fwupd support plugin'
              'ostree: OSTree support plugin')

  DESTDIR="$pkgdir" meson install -C build

  # Split out packagekit plugin
  mkdir "$srcdir"/packagekit-plugin
  mv "$pkgdir"/usr/lib/gs-plugins-12/libgs_plugin_{packagekit*,systemd-updates}.so "$srcdir"/packagekit-plugin
}

package_gnome-software-packagekit-plugin-snap() {
  pkgdesc="PackageKit support plugin for GNOME Software"
  conflicts=(gnome-software-packagekit-plugin)
  provides=(gnome-software-packagekit-plugin)
  depends=(archlinux-appstream-data gnome-software packagekit)

  mkdir -p "$pkgdir"/usr/lib/gs-plugins-12
  mv "$srcdir"/packagekit-plugin/* "$pkgdir"/usr/lib/gs-plugins-12/
}
