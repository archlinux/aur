# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: VirtualTam <virtualtam@flibidi.net>

_pkgname=ganv
pkgname=$_pkgname-git
pkgver=1.8.2.r27.ga59bd3b
pkgrel=1
pkgdesc='An interactive Gtkmm canvas widget for graph-based interfaces (git version)'
arch=(x86_64)
url='https://gitlab.com/drobilla/ganv'
license=(GPL-3.0-or-later)
depends=(cairo gcc-libs glib2 glibc graphviz 'gtk2>=2.10' 'gtkmm>=2.10' libsigc++ pango)
makedepends=(git meson)
provides=($_pkgname lib$_pkgname-${pkgver::1}.so)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/drobilla/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver="$(grep -A 15 ^project meson.build | grep '^ *version:' | cut -d "'" -f 2)"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^release-//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

build(){
  arch-meson --reconfigure $_pkgname $_pkgname-build -D nls=disabled
  meson compile -C $_pkgname-build
}

package() {
  depends+=(libcairo.so libgdk-x11-2.0.so libglib-2.0.so libgobject-2.0.so
    libgtk-x11-2.0.so libpango-1.0.so libpangocairo-1.0.so libsigc-2.0.so)
  meson install -C $_pkgname-build --destdir=${pkgdir}
  install -vDm 644 $_pkgname/{AUTHORS,NEWS,README.md} \
    -t "$pkgdir"/usr/share/doc/$pkgname
}
