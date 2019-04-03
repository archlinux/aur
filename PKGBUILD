# Maintainer: Mitchell Renouf <mitchellarenouf@gmail.com>


_pkgbase=gnome-software
pkgbase=gnome-software-snap
pkgname=gnome-software-snap
pkgver=3.32.0
_pkgver=3.32
pkgrel=1
pkgdesc="GNOME Software Tools with built in snap support"
url="https://download.gnome.org/sources/gnome-software/"
arch=(x86_64)
license=(GPL2)
makedepends=(appstream-glib gnome-desktop libpackagekit-glib flatpak fwupd ostree
             docbook-xsl git gobject-introspection gspell gtk-doc meson valgrind snapd-glib liboauth)
source=("http://download.gnome.org/sources/$_pkgbase/$_pkgver/$_pkgbase-$pkgver.tar.xz")
sha256sums=('a104a13dda7d84d9892eabb32db08f32ea7f57f193c4988286d9e5adfcdc19a6')

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
  conflicts=(gnome-software gnome-software-packagekit-plugin gnome-software-packagekit-plugin-snap)
  provides=(gnome-software)
  depends=(appstream-glib gnome-desktop gsettings-desktop-schemas gspell libpackagekit-glib snapd liboauth)
  optdepends=('flatpak: Flatpak support plugin'
              'fwupd: fwupd support plugin'
              'ostree: OSTree support plugin')

  DESTDIR="$pkgdir" meson install -C build

}

