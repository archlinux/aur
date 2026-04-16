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
# Maintainer: Albert Vaca Cintora <albertvaka@gmail.com>

pkgbase=nautilus-typeahead
pkgname=(
  nautilus-typeahead
  libnautilus-extension-typeahead
)
packager="Albert Vaca Cintora <albertvaka@gmail.com>"
pkgver=50.1
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
  "0001-Restore-backspace-for-going-to-parent-folder.patch"
  "0002-Restore-typeahead-support-for-keyboard-navigation.patch"
  "post.install"
)
b2sums=(
  '7a69b11b6053a22858a000a8d0b0a39085b061dce6e5dab792fde58b5bed7f8464f2ef4aaadc1d83056f7ceff948b3c40f433f5fa4fb2d3c5865adf74b666460'
  'b9af0c0c3c9e233d13a1287d5f5fa7b159cff5532ccd589791c4916f34c69cc27755207cbec1c0a87ccce7a273d3e7d3f9c1d756e2a6bedae0124f30a214fef0'
  '36aa7c865278fae3a9444f367cbe8104e3806bd35b580096a12d8af6e95db40c0d3a93ef7e02b4d2dcc46fd9a2dd8b6706d8089e815ead0efc8c3ed7cb8b672a'
  '7ba197c2e65108ab49c1795c44264181c3c6b8f7d6641d1b1353690202c915e0aed574f45467924f6fb67a65f9487a3c0e24252633066e25b4d2c0dac3609245'
)

prepare() {
  cd nautilus

  # Apply typeahead patches
  for p in ../????-*.patch; do
    patch -Np1 -i "$p"
  done

  # Enable typeahead behavior by default
  gawk -i inplace '/type-ahead-search/{c++;} c==1 && /true/{sub("true", "false"); c++;} 1' data/org.gnome.nautilus.gschema.xml
}

build() {
  local meson_options=(
    -D docs=false
    -D selinux=disabled
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
