# Contributor (maintainer of official Nautilus package): Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor (maintainer of official Nautilus package): Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor (contributor to official Nautilus package): Jan de Groot <jgc@archlinux.org>
# Contributor (original typeahead patch code): Jan de Groot <jgc@archlinux.org>
# Contributor (original package maintainer): Ian Hernández <badwolfie@archlinux.info>
# Contributor (current typeahead patch code): Xavier Claessens <xavier.claessens@collabora.com>
# Contributor (updated Xavier's typeahead patch for 43.2): Bryan Lai <bryanlais@gmail.com>
# Contributor (updated Xavier's typeahead patch for 44.1): DragoonAethis <dragoon@dragonic.eu>
# Contributor (updated Xavier's typeahead patch for 49.0): Kevin MacMartin <prurigro@gmail.com>
# Contributor (updated Xavier's typeahead patch for 50.0): Daniel Rudolf <archlinux.org@daniel-rudolf.de>
# Contributor (backspace patch code): Jeremy Bicha <jbicha@debian.org>
# Contributor (rewrote the typeahead patch for 51.2): Ben Scholzen (DASPRiD) <mail@dasprids.de>
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgbase=nautilus-typeahead
pkgname=(
  nautilus-typeahead
  libnautilus-extension-typeahead
)
packager="Albert Vaca Cintora <albertvaka@gmail.com>"
pkgver=51.2
pkgrel=1
pkgdesc="Default file manager for GNOME - Patched to bring back the 'typeahead find' feature"
url="https://apps.gnome.org/Nautilus/"
arch=(x86_64)
license=(GPL-3.0-or-later)
depends=(
  cairo
  dconf
  gdk-pixbuf2
  gexiv2
  glib2
  glibc
  glycin
  glycin-gtk4
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
  libgcc
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
  blueprint-compiler
  git
  glib2-devel
  gobject-introspection
  meson
  ninja
  pkgconfig
)
source=(
  "git+https://gitlab.gnome.org/GNOME/nautilus.git#tag=${pkgver/[a-z]/.&}"
  "git+https://gitlab.gnome.org/GNOME/libgxdp.git#commit=528966b82cfb8c276319aa1436d424b949a274e0"
  "0001-Restore-backspace-for-going-to-parent-folder.patch"
  "0002-Type-ahead-find.patch"
  "post.install"
)
b2sums=(
    '261d337a8bae32bb6a005f57f874bd075a2644ceecf6de96afc0232ca00861a9e0b64c65b5de5953d9342fde06dec6620151a39aa55281672c3a640e896dcef6'
    '16c53dd8c0a68a8e85924ac72a651e5c24077b4be561d64807a84e1e94b1e38085cf93bedd7ef9b298d1bd30f3eacafb10c8433a171aae8bc3137fa8199e6edf'
    'b9af0c0c3c9e233d13a1287d5f5fa7b159cff5532ccd589791c4916f34c69cc27755207cbec1c0a87ccce7a273d3e7d3f9c1d756e2a6bedae0124f30a214fef0'
    '2828612b727da645c4e7cde2a2ff2b542513d0f52885c4a84ebfd4533d3338d9d3fc650fe0275ee4c5e20da1d16608fa0b6ccbee03aae24a2ec83d26f8fe13b3'
    '7ba197c2e65108ab49c1795c44264181c3c6b8f7d6641d1b1353690202c915e0aed574f45467924f6fb67a65f9487a3c0e24252633066e25b4d2c0dac3609245'
)

prepare() {
  # Do not fail the build if the old patch name is still there
  rm 0002-Restore-typeahead-support-for-keyboard-navigation.patch || true

  cd nautilus

  # Our patches create these files, so they might survive accross builds even after resetting the git repo, which causes the subsequent patch to fail
  rm src/nautilus-typeahead.c src/nautilus-typeahead.h || true

  # Apply typeahead patches
  for p in ../????-*.patch; do
    patch -Np1 -i "$p"
  done
}

build() {
  local meson_options=(
    -D docs=false
    -D selinux=disabled
  )

  # Inject libgxdp
  export MESON_PACKAGE_CACHE_DIR="$srcdir"

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
    libnautilus-extension.so
    libnautilus-extension-typeahead
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
    glib2
    glibc
    libgcc
  )
  conflicts=(libnautilus-extension)
  provides=(
    libnautilus-extension
    libnautilus-extension.so
  )

  mv libne/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
