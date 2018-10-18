# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>


_pkgbase=gnome-software
pkgbase=gnome-software-snap
pkgname=(gnome-software-snap gnome-software-packagekit-plugin-snap)
pkgver=3.30.2
_pkgver=3.30.2-0ubuntu5
pkgrel=1
pkgdesc="GNOME Software Tools with built in snap support"
url="https://launchpad.net/gnome-software"
arch=(x86_64)
license=(GPL2)
makedepends=(appstream-glib gnome-desktop libpackagekit-glib flatpak fwupd ostree
             docbook-xsl git gobject-introspection gspell gtk-doc meson valgrind snapd-glib)
source=("https://launchpad.net/ubuntu/+archive/primary/+sourcefiles/gnome-software/$_pkgver/gnome-software_$pkgver.orig.tar.xz")
sha256sums=('af1bf97733e0f35e9131ab5b16ff3abdd70b69f6bffa96951739f61369fe37a7')




prepare() {
  cd $_pkgbase-$pkgver
}

build() {
  arch-meson --reconfigure $_pkgbase-$pkgver build \
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
