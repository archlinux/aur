# Maintainer: Philip Goto <philip.goto@gmail.com>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgbase=nautilus-git
pkgname=(nautilus-git libnautilus-extension-git)
pkgver=3.30.0.r165.g20339a8bb
pkgrel=1
pkgdesc="Default file manager for GNOME"
url="https://wiki.gnome.org/Apps/Nautilus"
arch=(i686 x86_64 armv6h armv7h)
license=(GPL)
depends=(libgexiv2 gnome-desktop gvfs dconf tracker nautilus-sendto gnome-autoar)
makedepends=(gobject-introspection packagekit git gtk-doc meson appstream-glib)
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
  arch-meson nautilus build -D docs=true
  ninja -C build
}

check() {
  meson test -C build
}

package_nautilus-git() {
  depends+=(libnautilus-extension)
  provides=(nautilus)
  conflicts=(nautilus)
  groups=(gnome)

  DESTDIR="$pkgdir" meson install -C build

### Split libnautilus-extension

  mkdir -p libne/{lib,share}
  mv "$pkgdir"/usr/include libne
  mv "$pkgdir"/usr/lib/{girepository-1.0,libnautilus-extension*,pkgconfig} libne/lib
  mv "$pkgdir"/usr/share/{gir-1.0,gtk-doc} libne/share
}

package_libnautilus-extension-git() {
  pkgdesc="Library for extending the $pkgdesc"
  depends=(gtk3)
  provides=(libnautilus-extension)
  conflicts=(libnautilus-extension)
  
  mv libne "$pkgdir/usr"
}
