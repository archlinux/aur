# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>


pkgbase=gnome-software-snap
pkgname=(gnome-software-snap gnome-software-packagekit-plugin-snap)
pkgver=3.30.2
pkgrel=1
pkgdesc="GNOME Software Tools"
url="https://wiki.gnome.org/Apps/Software/"
arch=(x86_64)
license=(GPL2)
makedepends=(appstream-glib gnome-desktop libpackagekit-glib flatpak fwupd ostree
             docbook-xsl git gobject-introspection gspell gtk-doc meson valgrind snapd-glib)
_commit=035e0f7459d5b0eaafd120b88f3b8b39bbb5ef2a  # tags/3.30.2^0
source=("git+https://gitlab.gnome.org/GNOME/gnome-software.git#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --tags | sed 's/^GNOME_SOFTWARE_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgbase
}

build() {
  arch-meson $pkgbase build \
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
  depends=(appstream-glib gnome-desktop gsettings-desktop-schemas gspell libpackagekit-glib)
  optdepends=('flatpak: Flatpak support plugin'
              'fwupd: fwupd support plugin'
              'snapd: Snap support plugin'
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
