# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=nautilus-git
pkgname=(nautilus-git libnautilus-extension-git)
pkgver=3.37.1.1.r10.g23a2a67b1
pkgrel=1
pkgdesc="Default file manager for GNOME"
url="https://wiki.gnome.org/Apps/Files"
arch=(i686 x86_64 armv7h aarch64)
license=(GPL)
depends=(libgexiv2 gnome-desktop gvfs dconf tracker gnome-autoar gst-plugins-base-libs tracker-miners)
makedepends=(gobject-introspection git gtk-doc meson appstream-glib)
options=(!emptydirs)
source=("git+https://gitlab.gnome.org/GNOME/nautilus.git"
        "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd nautilus

  git submodule init
  git config --local submodule.subprojects/libgd.url "$srcdir/libgd"
  git submodule update
}

pkgver() {
  cd nautilus
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson nautilus build -D docs=true -D packagekit=false
  ninja -C build
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
  depends+=(libnautilus-extension)
  provides=(nautilus)
  conflicts=(nautilus)
  optdepends=('nautilus-sendto: Send files via mail extension')
  groups=(gnome)

  DESTDIR="$pkgdir" meson install -C build

### Split libnautilus-extension

  _pick libne "$pkgdir"/usr/include
  _pick libne "$pkgdir"/usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig}
  _pick libne "$pkgdir"/usr/share/{gir-1.0,gtk-doc}
}

package_libnautilus-extension-git() {
  pkgdesc="Library for extending GNOME Files"
  depends=(gtk3)
  provides=(libnautilus-extension libnautilus-extension.so)
  conflicts=(libnautilus-extension)
  
  mv libne/* "$pkgdir"
}
