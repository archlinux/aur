# $Id$
# Maintainer: Sven Fischer <aur.archlinux@linux4tw.de>

pkgname=read-it-later-git
_pkgname=read-it-later
pkgver=0.0.2.r144.ce19c0d
pkgrel=1
pkgdesc='A wallabag client GTK GUI'
arch=('i686' 'x86_64')
url='https://belmoussaoui.com/2020/02/04/read-it-later/'
license=('GPL3')
provides=(${pkgname%-*})
conflicts=()
depends=('appstream-glib' 'libhandy0' 'webkit2gtk')
makedepends=('cmake' 'git' 'meson' 'rust')
source=('git+https://gitlab.gnome.org/World/read-it-later.git')
sha512sums=('SKIP')
builddir=build

pkgver() {
  cd "${srcdir}/${_pkgname}"
  local srcversion="$(grep "version" Cargo.toml | head -n1 | cut -d '"' -f 2)"
  printf "%s.r%s.%s" $srcversion "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  meson --prefix /usr $builddir
  ninja -v -C $builddir
}

check() {
  cd "${srcdir}/${_pkgname}"
  ninja -C $builddir test
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" ninja -C $builddir install
}
