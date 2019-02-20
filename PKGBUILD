# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Andreas Radke <andyrtr@archlinux.org>
# Contributor: Michael Kanis <mkanis@gmx.de>

pkgname=libchamplain
pkgver=0.12.17
pkgrel=1
pkgdesc="A map widget"
url="https://wiki.gnome.org/Projects/libchamplain"
license=(LGPL)
arch=(x86_64)
depends=(clutter-gtk libsoup cairo sqlite)
makedepends=(gobject-introspection gtk-doc vala meson git)
_commit=5d2f7f938471d9455aa08bd6bb1f0a244984713c  # tags/LIBCHAMPLAIN_0_12_17^0
source=("git+https://gitlab.gnome.org/GNOME/libchamplain.git#commit=$_commit"
        build.diff)
sha256sums=('SKIP'
            '1146f8cc78e5ab7986a9f047ff6b7a5e4ba60552907498a6097bb78bdacfec4d')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^LIBCHAMPLAIN_//;s/_/./g;s/-/+/g'
}

prepare() {
  cd $pkgname
  patch -Np1 -i ../build.diff
}

build() {
  arch-meson $pkgname build -D gtk_doc=true
  ninja -C build
}

check() {
  meson test -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
