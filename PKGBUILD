# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wireplumber-git
pkgver=0.2.0+74.g80dc7723fc
pkgrel=1
pkgdesc="PipeWire modular Session & Policy Manager"
arch=(x86_64)
url="https://gitlab.freedesktop.org/pipewire/wireplumber"
license=(MIT)
source=("git+$url.git")
sha256sums=('SKIP')
depends=(pipewire)
makedepends=(hotdoc)
conflicts=(wireplumber)
provides=(wireplumber=${pkgver%+*})

pkgver() {
  git -C wireplumber describe --abbrev=10 | sed 's/-/+/; s/-/./'
}

prepare() {
  arch-meson wireplumber build \
    --wrap-mode forcefallback \
    -D doc=enabled
}

build() {
  ninja -C build
}

# currently broken, see https://gitlab.freedesktop.org/pipewire/wireplumber/issues/8
false &&
check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
