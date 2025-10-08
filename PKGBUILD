# $Id: PKGBUILD 278826 2016-10-15 00:15:40Z heftig $
# Contributor (original patch code): Jan de Groot <jgc@archlinux.org>
# Contributor (original package maintainer): Ian Hernández <badwolfie@archlinux.info>
# Contributor (updated Xavier's patch for 43.2): Bryan Lai <bryanlais@gmail.com>
# Contributor (updated Xavier's patch for 44.1): DragoonAethis <dragoon@dragonic.eu>
# Contributor (updated Xavier's patch for 49.0): Kevin MacMartin <prurigro@gmail.com>
# Contributor (fix for backspace going to parent folder): Jeremy Bicha <jbicha@debian.org>
# Contributor (current patch code): Xavier Claessens <xavier.claessens@collabora.com>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgbase=nautilus-typeahead
pkgname=(
  nautilus-typeahead
  libnautilus-extension-typeahead
)
packager="Albert Vaca Cintora <albertvaka@gmail.com>"
pkgver=49.0
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://apps.gnome.org/Nautilus/"
arch=(x86_64)
license=(GPL)
depends=(
  cairo
  dconf
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gnome-autoar
  gnome-desktop-4
  graphene
  gst-plugins-base-libs
  gstreamer
  gtk4
  gvfs
  hicolor-icon-theme
  icu
  libadwaita
  libcloudproviders
  libgexiv2
  libportal
  libportal-gtk4
  libx11
  localsearch
  pango
  tinysparql
  wayland
  xdg-user-dirs-gtk
)
makedepends=(
  appstream
  git
  gobject-introspection
  meson
  ninja
  pkgconfig
  glib2-devel
)
_commit=a506a81265dfd9b9960bdad6ef382f1ee0b61e08
source=(
  "git+https://gitlab.gnome.org/albertvaka/nautilus.git#commit=$_commit"
)
b2sums=('SKIP')

prepare() {
  cd nautilus
  # Enable type-ahead behavior by default
  awk -i inplace '/type-ahead-search/{c++;} c==1 && /true/{sub("true", "false"); c++;} 1' data/org.gnome.nautilus.gschema.xml
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
