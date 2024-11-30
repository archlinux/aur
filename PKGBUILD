# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=v4l-utils-git
pkgver=1.28.1.r52.g363495b6
pkgrel=2
pkgdesc="Userspace tools and conversion library for Video 4 Linux"
arch=('i686' 'x86_64')
url="https://linuxtv.org/"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('gcc-libs' 'hicolor-icon-theme' 'json-c' 'libjpeg-turbo' 'systemd-libs')
makedepends=('git' 'alsa-lib' 'clang' 'doxygen' 'libbpf' 'meson' 'qt6-base' 'qt6-5compat')
optdepends=('alsa-lib: for qv4l2'
            'libbpf: for ir-keytable'
            'qt6-base: for qv4l2 and qvidcap'
            'qt6-5compat: for qv4l2 and qvidcap')
provides=("v4l-utils=$pkgver" 'edid-decode')
conflicts=('v4l-utils' 'edid-decode')
backup=('etc/rc_maps.cfg')
options=('staticlibs')
source=("git+https://git.linuxtv.org/v4l-utils.git")
sha256sums=('SKIP')


prepare() {
  cd "v4l-utils"

  sed -i 's/sbin/bin/' "utils/v4l2-dbg/meson.build"
}

pkgver() {
  cd "v4l-utils"

  _tag=$(git tag -l --sort -v:refname | sed '/rc[0-9]*/d' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v4l-utils-//'
}

build() {
  cd "v4l-utils"

  CFLAGS="$CFLAGS -ffat-lto-objects" \
  CXXFLAGS="$CXXFLAGS -ffat-lto-objects" \
  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -Db_pie="true" \
    -Ddefault_library="both" \
    -Dgconv="disabled" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "v4l-utils"

  #meson test -C "_build"
}

package() {
  cd "v4l-utils"

  meson install -C "_build" --destdir "$pkgdir"
}
