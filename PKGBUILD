# Maintainer: Igor <f2404@yandex.ru>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Original package: Ionut Biru <ibiru@archlinux.org>

_gitname=vte
_realname=vte3
pkgname=$_realname-git

pkgver=0.57.0.4525.bc983ed0
pkgrel=1
pkgdesc="Virtual Terminal Emulator widget for use with GTK3"
arch=('i686' 'x86_64')
license=('LGPL')
options=('!emptydirs')
makedepends=('intltool' 'gobject-introspection' 'vala' 'gtk-doc' 'gperf' 'meson>=0.49.0')
url="http://www.gnome.org"
depends=('gtk3' 'vte-common' 'glibc' 'pcre2')

provides=(vte3=$pkgver vte-common)
conflicts=($_realname vte-common)

source=("git+https://gitlab.gnome.org/GNOME/$_gitname.git")
md5sums=("SKIP")

prepare() {
  cd $_gitname
  meson setup --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/vte --localstatedir=/var \
      builddir
}

pkgver() {
  cd $_gitname
  version=$(grep "\#define VERSION " builddir/config.h | sed 's/\#define VERSION //' | sed 's/\"//g')
  hash=$(git log --pretty=format:'%h' -n 1)
  revision=$(git rev-list --count HEAD)
  echo $version.$revision.$hash
}

build() {
  cd $_gitname
  ninja -C builddir
}

package() {
  cd $_gitname
  DESTDIR="$pkgdir" meson install -C builddir
}
