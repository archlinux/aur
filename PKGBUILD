# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor (original patch code): Jan de Groot <jgc@archlinux.org>
# Contributor (original package maintainer): Ian Hernández <badwolfie@archlinux.info>
# Contributor (current patch code): Xavier Claessens <xavier.claessens@collabora.com>
# Contributor (fix for backspace going to parent folder): Jeremy Bicha <jbicha@debian.org>
# Contributor (updated patch for 43.2): Bryan Lai <bryanlais@gmail.com>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

_pkgbase=nautilus
pkgbase=nautilus-typeahead
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
packager="Albert Vaca Cintora <albertvaka@gmail.com>"
pkgver=43.2
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Files"
arch=(x86_64)
license=(GPL)
depends=(libgexiv2 gdk-pixbuf2 gst-plugins-base-libs gnome-desktop-4 gvfs dconf
         tracker3 tracker3-miners gnome-autoar libadwaita libportal-gtk4
         libcloudproviders)
makedepends=(gobject-introspection git meson appstream-glib meson ninja)
checkdepends=(python-gobject)
_commit=506477f48a0a5a87a13d64d617b6d4b51106702b  # tags/43.2^0
source=("git+https://gitlab.gnome.org/GNOME/nautilus.git#commit=$_commit"
        nautilus-restore-typeahead.patch)
sha256sums=('SKIP'
            '4f1d3b76d400bd91102bad35b873115d595216df5360cf60fe41c6428c6d09c1')

pkgver() {
  cd nautilus
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd nautilus
  patch -p1 -i ../nautilus-restore-typeahead.patch
}

build() {
  if [ -e build ] ; then
      rm -r build
  fi

  local meson_options=(
    -D docs=false
    -D packagekit=false
  )

  arch-meson nautilus build "${meson_options[@]}"
  meson compile -C build
}

#check() {
#  meson test -C build --print-errorlogs
#}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

package_nautilus-typeahead() {
  depends+=(libnautilus-extension-typeahead)
  optdepends=('nautilus-sendto: to share files from the right click menu'
            'python-nautilus: to use extensions written in python')
  install='post.install'
  conflicts=(nautilus)
  provides=(nautilus)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  # Split libnautilus-extension
  _pick libne usr/include
  _pick libne usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig}
  _pick libne usr/share/gir-1.0
}

package_libnautilus-extension-typeahead() {
  pkgdesc="Extension interface for Nautilus"
  depends=(glib2 gcc-libs)
  conflicts=(libnautilus-extension libnautilus-extension.so)
  provides=(libnautilus-extension libnautilus-extension.so)

  mv libne/* "$pkgdir"
}
