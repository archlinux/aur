pkgbase=gnome-software-git
pkgname=(gnome-software-git gnome-software-packagekit-plugin-git)
pkgver=40.0+99+g3f5ae4dc
pkgrel=1
pkgdesc="GNOME Software Tools"
url="https://wiki.gnome.org/Apps/Software/"
arch=(x86_64)
license=(GPL2)
makedepends=('appstream' 'gsettings-desktop-schemas' 'libpackagekit-glib' 'flatpak'
             'fwupd' 'docbook-xsl' 'git' 'gobject-introspection' 'gspell' 'gtk-doc' 'meson'
             'valgrind' 'gnome-online-accounts' 'libxmlb' 'malcontent' 'libhandy')
source=("git+https://gitlab.gnome.org/GNOME/gnome-software.git")
b2sums=('SKIP')

pkgver() {
  cd gnome-software
  git describe --tags | sed 's/^GNOME_SOFTWARE_//;s/_/./g;s/-/+/g'
}

build() {
  # Ensure static library is non-LTO compatible
  CFLAGS+=" -ffat-lto-objects"

  arch-meson gnome-software build -D sysprof=disabled
  meson compile -C build
}

check() {
  # build container troubles
  meson test -C build --print-errorlogs || :
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_gnome-software-git() {
  depends=('libxmlb' 'gsettings-desktop-schemas' 'gspell' 'libpackagekit-glib'
           'gnome-online-accounts' 'appstream' 'libhandy')
  optdepends=('flatpak: Flatpak support plugin'
              'fwupd: fwupd support plugin'
              'malcontent: Parental control plugin')
  provides=('gnome-software')
  conflicts=('gnome-software')

  DESTDIR="$pkgdir" meson install -C build

### Split gnome-software-packagekit-plugin-git
  local pkglibdir="$pkgdir/usr/lib/gnome-software"
  _pick packagekit-plugin "$pkglibdir"/plugins-*/libgs_plugin_packagekit*.so
  _pick packagekit-plugin "$pkglibdir"/plugins-*/libgs_plugin_systemd-updates.so
}

package_gnome-software-packagekit-plugin-git() {
  pkgdesc="PackageKit support plugin for GNOME Software"
  depends=('archlinux-appstream-data' 'gnome-software' 'packagekit')
  provides=('gnome-software-packagekit-plugin')
  conflicts=('gnome-software-packagekit-plugin')
  mv packagekit-plugin/* "$pkgdir"
}
