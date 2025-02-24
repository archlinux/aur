# Maintainer:  <castix at autistici dot org>
# Contributor: Christopher Arndt <aur -at- chrisarndt -dot de>

_pkgname=airwindows-lv2
pkgname=$_pkgname-git
pkgver=30.0.r5.gfae6167
pkgrel=1
pkgdesc="LV2 port of Airwindows audio plugins (git version)"
arch=(x86_64)
url='https://sr.ht/~hannes/airwindows-lv2'
license=(MIT)
groups=(lv2-plugins pro-audio)
depends=(glibc)
makedepends=(git lv2 meson)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://git.sr.ht/~hannes/airwindows-lv2#branch=dev")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver="$(grep -A 5 ^project meson.build | grep '^ *version:' | cut -d "'" -f 2)"

  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/^release-//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    echo "$ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson \
    --reconfigure \
    --buildtype=release \
     $_pkgname-build $_pkgname
  meson compile -C $_pkgname-build
}

package() {
  meson install -C $_pkgname-build --destdir "$pkgdir"
  install -vDm 644 $_pkgname/{NOTES,README}.md \
    -t "$pkgdir"/usr/share/doc/$pkgname
  install -vDm 644 $_pkgname/LICENSE \
    -t "$pkgdir"/usr/share/licenses/$pkgname
}

# vim:set ts=2 sw=2 et:
