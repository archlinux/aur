# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot de>
# Contributor: kamnxt <kamnxt@kamnxt.com>
# Contributor: RedTide <redtid3@gmail.com>

_pkgname="pugl"
pkgname=$_pkgname-git
pkgver=0.5.3.r1185.edd13c1
pkgrel=1
pkgdesc='Minimal portable API for GUIs which is suitable for use in plugins (git version)'
url='https://drobilla.net/software/pugl'
arch=(x86_64)
license=(ISC)
depends=(cairo glibc libglvnd libx11 libxcursor libxext libxrandr vulkan-icd-loader)
makedepends=(meson git)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://gitlab.com/lv2/pugl/")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
  echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  test -d $_pkgname-build && EXTRA_OPTS="--reconfigure"
  arch-meson \
    --prefix=/usr \
    -Ddocs=disabled \
    $EXTRA_OPTS \
    $_pkgname-build \
    $_pkgname
  meson compile -C $_pkgname-build
}

package() {
  meson install -C $_pkgname-build --destdir="${pkgdir}"
  install -vDm 644 $_pkgname/COPYING -t "$pkgdir"/usr/share/licenses/$pkgname
}
