# Maintainer: Milkii Brewster <milkii on Freenode IRC>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot- de>

_name=DIE-Plugins
_pkgname=${_name,,}.lv2
pkgname=$_pkgname-git
pkgdesc="DISTRHO Imported Effect Plugins, Ardour's plugins without Ardour (git version)"
pkgver=1.1.r13.gb196b7e
pkgrel=1
arch=(x86_64)
url="https://github.com/DISTRHO/$_name"
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(glibc gcc-libs)
makedepends=(git glib2 libsndfile lv2)
optdepends=('lv2-host: for loading LV2 plugins')
provides=($_pkgname ${_name,,})
conflicts=($_pkgname ${_name,,})
source=("$_pkgname::git+https://github.com/DISTRHO/$_name")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname
  make
}

package() {
  depends+=(libglib-2.0.so libsndfile.so)
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  chmod +x "$pkgdir"/usr/lib/lv2/*.lv2/*.so
}
