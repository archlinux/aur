# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor (original patch code): Jan de Groot <jgc@archlinux.org>
# Contributor (original package maintainer): Ian Hernández <badwolfie@archlinux.info>
# Contributor (updated Xavier's patch for 43.2): Bryan Lai <bryanlais@gmail.com>
# Contributor (updated Xavier's patch for 44.1): DragoonAethis <dragoon@dragonic.eu>
# Contributor (fix for backspace going to parent folder): Jeremy Bicha <jbicha@debian.org>
# Contributor (current patch code): Xavier Claessens <xavier.claessens@collabora.com>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgbase=nautilus-typeahead
pkgname=(
  nautilus-typeahead
  libnautilus-extension-typeahead
)
packager="Albert Vaca Cintora <albertvaka@gmail.com>"
pkgver=46.0
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://wiki.gnome.org/Apps/Files"
arch=(x86_64)
license=(GPL)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  glib2
  gnome-autoar
  gnome-desktop-4
  gstreamer
  gst-plugins-base-libs
  gtk4
  gvfs
  hicolor-icon-theme
  libadwaita
  libcloudproviders
  libgexiv2
  libportal
  libportal-gtk4
  pango
  tracker3
)
makedepends=(
  appstream-glib
  git
  gobject-introspection
  graphene
  meson
  ninja
  pkgconfig
  tracker3-miners
)
checkdepends=(python-gobject)
_commit=6e96a9bca989a448abc0d89ef906aaf234a7bb77
source=(
  "git+https://gitlab.gnome.org/xclaesse/nautilus.git#commit=$_commit"
)
b2sums=('SKIP')

prepare() {
  cd nautilus
  # Enable type-ahead behavior by default
  awk -i '/type-ahead-search/{c++;} c==1 && /true/{sub("true", "false"); c++;} 1' data/org.gnome.nautilus.gschema.xml
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
  depends+=(
    'libnautilus-extension-typeahead'
    'graphene'
  )
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
