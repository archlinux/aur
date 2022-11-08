# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Ian Hernández <badwolfie@archlinux.info>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

_pkgbase=nautilus
pkgbase=nautilus-typeahead
pkgname=(nautilus-typeahead libnautilus-extension-typeahead)
packager="Albert Vaca Cintora <albertvaka@gmail.com>"
pkgver=42.2
pkgrel=2
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Files"
arch=(x86_64)
license=(GPL)
depends=(libgexiv2 gnome-desktop gvfs dconf tracker3 tracker3-miners
         gnome-autoar gst-plugins-base-libs libhandy libportal-gtk3)
makedepends=(gobject-introspection git gtk-doc meson appstream-glib 'meson>=0.44.1' ninja)
optdepends=('nautilus-sendto: right click to send files'
            'python-nautilus-1: to use extensions in python')
checkdepends=(python-gobject)
_commit=6a9ee939f5419262d7d0ce720572805f5f64569b
source=("git+https://gitlab.gnome.org/GNOME/nautilus.git#commit=$_commit"
        'git+https://gitlab.gnome.org/GNOME/libgd.git'
        nautilus-restore-typeahead.patch
        nautilus-thumbnails-compat.patch)
sha256sums=('SKIP'
            'SKIP'
            '52e9d930a01a40a8dde0136ded7b5c8283eb7d72f5a7bfb0790b0bbdbc2109bf'
            'd316704f8ecc89734342e962e2632baacbd65609677e25366bceef3c0b9df62c')

pkgver() {
  cd "$_pkgbase"
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd "$_pkgbase"

  git submodule init
  git config submodule.libgd.url "$srcdir/libgd"
  git submodule update

  patch -p1 -i ../nautilus-restore-typeahead.patch
  patch -p1 -i ../nautilus-thumbnails-compat.patch

}

build() {
  if [ -e build ] ; then
      rm -r build
  fi
  arch-meson "$_pkgbase" build \
    -D docs=true \
    -D packagekit=false
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
  conflicts=(nautilus)
  provides=(nautilus)
  groups=(gnome)

  DESTDIR="$pkgdir" meson install -C build

### Split libnautilus-extension

  _pick libne "$pkgdir"/usr/include
  _pick libne "$pkgdir"/usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig}
  _pick libne "$pkgdir"/usr/share/{gir-1.0,gtk-doc}
}

package_libnautilus-extension-typeahead() {
  pkgdesc="Library for extending the $pkgdesc"
  depends=(gtk3)
  conflicts=(libnautilus-extension libnautilus-extension.so)
  provides=(libnautilus-extension libnautilus-extension.so)
  mv libne/* "$pkgdir"
}
