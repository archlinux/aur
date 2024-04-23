# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

_pkgname=lvtk
pkgname=$_pkgname-git
pkgver=2.0.0rc1.r538.g2e47460
pkgrel=2
pkgdesc='A set of C++ wrappers around the LV2 C API'
arch=(x86_64)
url='https://github.com/lvtk/lvtk'
license=(GPL-3.0-or-later)
depends=(gcc-libs glibc lv2 libx11 libxcursor libxext libxrandr pugl)
makedepends=(boost git meson cairo)
# Lua bindings are commented out in meson.build for now (2024-04-23)
#optdepends=('lua: to use Lua bindings')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname::git+https://github.com/lvtk/lvtk.git")
md5sums=('SKIP')
changelog=ChangeLog


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed -e 's/^v//' -e 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  meson subprojects download --sourcedir=$_pkgname
}

build() {
  test -d $_pkgname-build && local extra_opts="--reconfigure"
  arch-meson \
    -Dplugins=enabled \
    -Ddemo=enabled \
    -Dtest=enabled \
    $extra_opts \
    $_pkgname-build $_pkgname
  meson compile -C $_pkgname-build
}

check() {
  meson test -C $_pkgname-build
}

package() {
  depends+=(libcairo.so)
  meson install -C $_pkgname-build --destdir="$pkgdir"
}

# vim:set ts=2 sw=2 et:
