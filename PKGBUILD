# Maintainer: David Garfias <jose.garfias@ingenieria.unam.edu> 
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Original package: Ionut Biru <ibiru@archlinux.org>

pkgname=vte3-git

pkgver=0.73.0.8.b7f34e9
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
arch=('x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'vala' 'gtk-doc' 'gperf' 'meson' 'ninja' 'git')
url="http://www.gnome.org"
depends=('gtk3' 'vte-common' 'glibc' 'pcre2')

provides=(vte3=$pkgver vte-common 'libvte-2.91.so')
conflicts=(vte3 vte-common)

source=("git+https://gitlab.gnome.org/GNOME/vte.git")
md5sums=("SKIP")

prepare() {
  arch-meson vte build \
      -D b_lto=false \
      -D sixel=true
}

pkgver() {
  version=$(grep "#define VERSION " build/config.h | sed 's/\#define VERSION //' | sed 's/\"//g')
  hash=$(git -C $SRCDEST log --pretty=format:'%h' -n 1)
  revision=$(git -C $SRCDEST  rev-list --count HEAD)
  echo $version.$revision.$hash
}


build() {
  ninja -C build
}

check() {
  ninja test -C build
}

package() {
  DESTDIR="$pkgdir" ninja install -C build
}
