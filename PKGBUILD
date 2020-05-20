pkgname=gnome-boxes-git
_pkgname=gnome-boxes
pkgver=3.35.90+130+g492e4a9a
pkgrel=1
pkgdesc="Simple GNOME application to access remote or virtual systems"
arch=('x86_64')
url="https://wiki.gnome.org/Apps/Boxes"
license=('LGPL')
depends=('cdrtools' 'gtk-vnc' 'libarchive' 'libgudev' 'libosinfo' 'libsecret'
         'libvirt-glib' 'mtools' 'qemu' 'spice-gtk' 'tracker' 'webkit2gtk' 'freerdp' 'libhandy')
makedepends=('git' 'gobject-introspection' 'yelp-tools' 'meson' 'spice-protocol' 'vala')
provides=('gnome-boxes')
conflicts=('gnome-boxes')
source=("git+https://gitlab.gnome.org/GNOME/gnome-boxes.git"
        "git+https://gitlab.gnome.org/GNOME/gtk-frdp.git"
        "git+https://gitlab.gnome.org/felipeborges/libovf-glib.git")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd $_pkgname
  git submodule init
  git submodule set-url subprojects/gtk-frdp "$srcdir/gtk-frdp"
  git submodule set-url subprojects/libovf-glib "$srcdir/libovf-glib"
  git submodule update
}

build() {
  arch-meson $_pkgname build
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
