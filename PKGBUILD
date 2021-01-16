pkgname=gnome-boxes-git
_pkgname=gnome-boxes
pkgver=3.37.90+158+g478d3c69
pkgrel=1
pkgdesc="Simple GNOME application to access remote or virtual systems"
arch=(x86_64)
url="https://wiki.gnome.org/Apps/Boxes"
license=(LGPL)
depends=('cdrtools' 'edk2-ovmf' 'freerdp' 'gtksourceview4' 'gtk-vnc' 'libarchive' 'libgudev' 'libhandy' 'libosinfo'
         'libsecret' 'libvirt-glib' 'mtools' 'qemu' 'spice-gtk' 'tracker3' 'webkit2gtk')
makedepends=('git' 'gobject-introspection' 'yelp-tools' 'meson' 'spice-protocol' 'vala')
provides=('gnome-boxes')
conflicts=('gnome-boxes')
source=("git+https://gitlab.gnome.org/GNOME/gnome-boxes.git"
        "git+https://gitlab.gnome.org/GNOME/gtk-frdp.git"
        "git+https://gitlab.gnome.org/GNOME/libhandy.git"
        "git+https://gitlab.gnome.org/felipeborges/libovf-glib.git")
b2sums=('SKIP'
        'SKIP'
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
  git submodule set-url subprojects/libhandy "$srcdir/libhandy"
  git submodule set-url subprojects/libovf-glib "$srcdir/libovf-glib"
  git submodule update
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
