# Maintainer: AmberArch <sawanon@protonmail.com>

pkgname=show-git
_pkgname=Show
pkgver=r59.9657faf
pkgrel=1
arch=(any)
pkgdesc="Realtime GLSL shader wallpapers"
url="https://github.com/danielfvm/Show"
license=("GPL")
# Show needs xrandr to build, but I don't know if its required for wayland systems.
depends=(imlib2 glew xorg-xrandr)
makedepends=(meson git cmake)
source=('git://github.com/danielfvm/Show.git')
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
cd "$_pkgname"
	mkdir build
	meson "$_pkgname/build" --prefix="$pkgdir/usr"
}

package() {
mkdir -p "$pkgdir/usr"
mkdir -p "$pkgdir/usr/share/show"
cd "$_pkgname"
	ninja -C "$_pkgname/build" install
	cp example/* LICENSE README.md "$pkgdir/usr/share/show"

}
