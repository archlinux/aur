# Maintainer: David Garfias <jose.garfias@ingenieria.unam.edu> 
# Contributor: Igor <f2404@yandex.ru>
# Contributor: Lubosz Sarnecki <lubosz@gmail.com>
# Original package: Ionut Biru <ibiru@archlinux.org>

_gitname=vte
_realname=vte3
pkgname=$_realname-git

pkgver=0.67.0.5137.ba78631c
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
arch=('x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'vala' 'gtk-doc' 'gperf' 'meson>=0.49.0')
url="http://www.gnome.org"
depends=('gtk3' 'vte-common' 'glibc' 'pcre2')

provides=(vte3=$pkgver vte-common 'libvte-2.91.so')
conflicts=($_realname vte-common)

source=("git+https://gitlab.gnome.org/GNOME/$_gitname.git")
md5sums=("SKIP")

pkgver() {
  cd $srcdir
  version=$(grep "\#define VERSION " build/config.h | sed 's/\#define VERSION //' | sed 's/\"//g')
  cd $_gitname
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $version.$revision.$hash
}

prepare() {
  cd $_gitname
}

build() {
  arch-meson $_gitname build \
    -D b_lto=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
