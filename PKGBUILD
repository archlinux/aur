# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor (original patch code): Jan de Groot <jgc@archlinux.org>
# Contributor (original package maintainer): Ian Hernández <badwolfie@archlinux.info>
# Contributor (current patch code): Xavier Claessens <xavier.claessens@collabora.com>
# Contributor (fix for backspace going to parent folder): Jeremy Bicha <jbicha@debian.org>
# Contributor (updated patch for 43.2): Bryan Lai <bryanlais@gmail.com>
# Contributor (updated patch for 44.1): DragoonAethis <dragoon@dragonic.eu>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgbase=nautilus-typeahead
pkgname=(
  nautilus-typeahead
  libnautilus-extension-typeahead
)
packager="Albert Vaca Cintora <albertvaka@gmail.com>"
pkgver=44.2
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Files"
arch=(x86_64)
license=(GPL)
depends=(
  dconf
  gdk-pixbuf2
  gnome-autoar
  gnome-desktop-4
  gst-plugins-base-libs
  gvfs
  libadwaita
  libcloudproviders
  libgexiv2
  libportal-gtk4
  tracker3
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  meson
  ninja
  tracker3-miners
)
checkdepends=(python-gobject)
_commit=909e2686a154af01101514b82044026d0359e82f  # tags/44.2^0
source=(
  "git+https://gitlab.gnome.org/GNOME/nautilus.git#commit=$_commit"
  nautilus-restore-typeahead.patch
)
b2sums=('SKIP'
        '6f8409caac8037f30f86c0893226c4463e67834784d8454df9f155e8289caeeafaff596d74d2f7ef0fb346b2193ab86aa90160e321f3b37379879d5471ccdcd4')

pkgver() {
  cd nautilus
  git describe --tags | sed 's/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd nautilus

  # Apply Typeahead patch
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
  optdepends=(
    'nautilus-sendto: Share files from the right click menu'
    'tracker3-miners: Full text search and metadata-based renaming'
    'python-nautilus: Use extensions written in python'
  )
  install='post.install'
  conflicts=(nautilus)
  provides=(nautilus)
  groups=(gnome)

  meson install -C build --destdir "$pkgdir"

  cd "$pkgdir"

  _pick libne usr/include
  _pick libne usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig}
  _pick libne usr/share/gir-1.0
}

package_libnautilus-extension-typeahead() {
  pkgdesc="Extension interface for Nautilus"
  depends=(
    gcc-libs
    glib2
  )
  conflicts=(libnautilus-extension libnautilus-extension.so)
  provides=(libnautilus-extension libnautilus-extension.so)

  mv libne/* "$pkgdir"
}
