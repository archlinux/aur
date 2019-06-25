# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=libgdata
pkgver=0.17.10
pkgrel=1
pkgdesc="GLib-based library for accessing online service APIs using the GData protocol"
url="https://wiki.gnome.org/Projects/libgdata"
arch=(x86_64)
license=(GPL)
depends=(libsoup liboauth gcr gnome-online-accounts)
makedepends=(gobject-introspection vala uhttpmock git gtk-doc meson)
_commit=f54d68f961015f85595b956ff0143a6ee0c41ff7  # tags/0.17.10^0
source=("git+https://gitlab.gnome.org/GNOME/libgdata.git#commit=$_commit"
        9.patch)
sha256sums=('SKIP'
            '1198980475de88a62d4868f89a5b5418dfa77befc40cf14716b240dd9685b61b')

pkgver() {
  cd $pkgname
  git describe --tags | sed -e 's/-/+/g'
}

prepare() {
  cd $pkgname

  # https://gitlab.gnome.org/GNOME/libgdata/merge_requests/9
  patch -Np1 -i ../9.patch
}

build() {
  arch-meson $pkgname build -D installed_tests=false -D man=true
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}

# vim:set sw=2 et:
