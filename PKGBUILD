# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mod-midi-merger
pkgname="$_pkgname-git"
pkgver=r53.ee60301
pkgrel=1
pkgdesc='JACK clients to merge/broadcast MIDI events from/to several in- or outputs (git version)'
arch=(x86_64)
url='https://github.com/moddevices/mod-midi-merger'
license=(ISC)
groups=(pro-audio)
depends=(glibc jack)
makedepends=(git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/moddevices/$_pkgname.git")
sha256sums=('SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
  cmake \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    -B $_pkgname-build -S $_pkgname
  cmake --build $_pkgname-build
}

package() {
  DESTDIR="$pkgdir" cmake --install $_pkgname-build
  install -Dm755 $_pkgname-build/mod-midi-*-standalone -t "$pkgdir"/usr/bin
  install -Dm644 $_pkgname/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
