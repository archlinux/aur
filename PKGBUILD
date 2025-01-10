# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=feedbackd-git
pkgver=0.6.0.r0.gda7065a
pkgrel=1
pkgdesc="A daemon to provide haptic, visual, and audio feedback on events"
url="https://source.puri.sm/Librem5/feedbackd"
license=(GPL3)
arch=(i686 x86_64 armv7h aarch64)
provides=(feedbackd)
conflicts=(feedbackd)
depends=(dconf gsound json-glib libgudev gsettings-desktop-schemas libgmobile)
makedepends=(git gobject-introspection meson vala git python-docutils glib2-devel)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%%-*}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "${variable%%,*}" build -Dgtk_doc=false -Dman=true -Dtests=true -Ddaemon=true
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
}
