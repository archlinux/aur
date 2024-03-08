# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iputils-git
pkgver=20240117.r11.g3400f3a
pkgrel=1
pkgdesc="Network monitoring tools, including ping"
arch=('i686' 'x86_64')
url="https://github.com/iputils/iputils"
license=('GPL-2.0-or-later' 'BSD-3-Clause')
depends=('glibc' 'libcap' 'libidn2' 'openssl')
makedepends=('git' 'meson' 'libxslt')
provides=("iputils=$pkgver")
conflicts=('iputils' 'arping' 'netkit-base')
source=("git+https://github.com/iputils/iputils.git")
sha256sums=('SKIP')


pkgver() {
  cd "iputils"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "iputils"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "iputils"

  meson test -C "_build"
}

package() {
  cd "iputils"

  meson install -C "_build" --destdir "$pkgdir"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/iputils"
  install -Dm644 "Documentation/LICENSE.BSD3" -t "$pkgdir/usr/share/licenses/iputils"
}
