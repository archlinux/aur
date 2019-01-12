# Maintainer: Ricardo Liang (rliang) <ricardoliang@gmail.com>

pkgbase=gnome-software-git
pkgname=(gnome-software-git gnome-software-packagekit-plugin-git)
pkgver=3.31.1+155+g18c9764d
pkgrel=1
pkgdesc="GNOME Software Tools"
url="https://wiki.gnome.org/Apps/Software/"
arch=(x86_64)
license=(GPL2)
makedepends=(appstream-glib gnome-desktop libpackagekit-glib flatpak fwupd ostree
             docbook-xsl git gobject-introspection gspell gtk-doc meson valgrind)
source=("git+https://gitlab.gnome.org/GNOME/gnome-software.git")
sha256sums=('SKIP')

pkgver() {
  cd gnome-software
  git describe --tags | sed 's/^GNOME_SOFTWARE_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd gnome-software
}

build() {
  arch-meson gnome-software build \
    -D ubuntuone=false \
    -D ubuntu_reviews=false
  ninja -C build
}

check() {
  # build container troubles
  meson test -C build || :
}

package_gnome-software-git() {
  groups=('gnome')
  provides=('gnome-software')
  conflicts=('gnome-software')
  depends=(appstream-glib gnome-desktop gsettings-desktop-schemas gspell libpackagekit-glib)
  optdepends=('flatpak: Flatpak support plugin'
              'fwupd: fwupd support plugin'
              'ostree: OSTree support plugin')

  DESTDIR="$pkgdir" meson install -C build

  # Split out packagekit plugin
  mkdir "$srcdir"/packagekit-plugin
  mv "$pkgdir"/usr/lib/gs-plugins-*/libgs_plugin_{packagekit*,systemd-updates}.so "$srcdir"/packagekit-plugin
}

package_gnome-software-packagekit-plugin-git() {
  provides=('gnome-software-packagekit-plugin')
  conflicts=('gnome-software-packagekit-plugin')
  pkgdesc="PackageKit support plugin for GNOME Software"
  depends=(archlinux-appstream-data gnome-software packagekit)

  mkdir -p "$pkgdir"/usr/lib/gs-plugins-*
  mv "$srcdir"/packagekit-plugin/* "$pkgdir"/usr/lib/gs-plugins-*/
}
