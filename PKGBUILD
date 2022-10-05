# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: lubosz <lubosz@gmail.com>
# Contributor: Kevin Majewski <kevin.majewski02@gmail.com>

# shellcheck disable=SC2034
_pkgbase=nautilus
pkgbase="${_pkgbase}-git"
pkgname=("${pkgbase}" 'libnautilus-extension-git')
pkgver=43.0+11+g992ff6204
pkgrel=1
pkgdesc="Default file manager for GNOME"
url="https://wiki.gnome.org/Apps/Files"
arch=(x86_64)
license=(GPL)
depends=('libgexiv2' 'gnome-desktop-4' 'gvfs' 'dconf' 'tracker3' 'tracker3-miners'
         'gnome-autoar' 'gst-plugins-base-libs' 'libportal-gtk4')
makedepends=('cmake' 'gobject-introspection' 'git' 'gtk-doc' 'meson' 'appstream-glib')
checkdepends=('python-gobject')
source=("git+https://gitlab.gnome.org/GNOME/nautilus.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
b2sums=('SKIP'
        'SKIP')

# shellcheck disable=SC2154
prepare() {
  cd "${_pkgbase}" || exit

  git submodule init
  git submodule set-url subprojects/libgd "${srcdir}/libgd"
  git submodule update
}

pkgver() {
  cd $_pkgbase || exit
  git describe --tags | sed 's/-/+/g'
}

build() {
  arch-meson "${_pkgbase}" build \
    -D docs=true \
    -D packagekit=false
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
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

package_nautilus-git() {
  depends+=('libnautilus-extension')
  optdepends=('nautilus-sendto: Send files via mail extension')
  provides=('nautilus')
  conflicts=('nautilus')

  DESTDIR="$pkgdir" meson install -C build

### Split libnautilus-extension

  _pick libne "$pkgdir"/usr/include
  _pick libne "$pkgdir"/usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig}
  _pick libne "$pkgdir"/usr/share/gir-1.0
}

package_libnautilus-extension-git() {
  pkgdesc="Library for extending the $pkgdesc"
  depends=('gtk4')
  provides=('libnautilus-extension' 'libnautilus-extension.so')
  conflicts=('libnautilus-extension')
  mv libne/* "$pkgdir"
}

# vim:set sw=2 et:
