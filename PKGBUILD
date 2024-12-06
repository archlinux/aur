# Maintainer: Tianhao Wang <i dot shrik3 dot com>
# 2020, maintainer by: Davide Depau <davide@depau.eu>

_pkgname=wlclock
pkgname=$_pkgname-git
pkgver=v1.0.1.r0.g52c56a4
pkgrel=1
pkgdesc="Simple GTKmm/Cairo based clock that works on Wayland "
arch=('i686' 'x86_64')
depends=('glibc' 'wayland' 'cairo')
makedepends=('ninja' 'meson' 'git')
url="https://github.com/Depau/wlclock"
license=('GPL-3.0-only')
source=(${_pkgname}::git+https://git.sr.ht/~leon_plickat/wlclock)
sha256sums=('SKIP')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/${_pkgname}"
  meson -Dprefix=/usr build
  ninja -C build
}

package() {
  cd "$srcdir/${_pkgname}"
  meson install -C build --destdir "$pkgdir"
}
