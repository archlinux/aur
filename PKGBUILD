
# Maintainer:  Josh Ellithorpe <quest@mac.com>

pkgname=plank-reloaded-git
pkgver=0.11.100.r0.ga9d4343
pkgrel=1
pkgdesc='Fork of the original Plank project, focusing on Cinnamon desktop compatibility
and modernized features'
arch=('x86_64')
url='https://github.com/zquestz/plank-reloaded'
license=('GPL3')
depends=('atk' 'bamf' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus'
         'gtk3' 'libgee' 'libwnck3' 'libx11' 'libxfixes' 'libxi' 'pango')
makedepends=('gnome-common' 'git' 'intltool' 'vala')
provides=('plank')
conflicts=('plank')
source=('git+https://github.com/zquestz/plank-reloaded.git')
sha256sums=('SKIP')

pkgver() {
  cd plank-reloaded
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd plank-reloaded
  sed 's/0.19.6/0.20/' -i configure.ac
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd plank-reloaded
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --disable-apport
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  make DESTDIR="${pkgdir}" -C plank-reloaded install
}

# vim: ts=2 sw=2 et:
