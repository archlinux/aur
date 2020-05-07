# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=wireplumber-git
pkgver=0.2.0+73.g8c209ecf48
pkgrel=1
pkgdesc="PipeWire modular Session & Policy Manager"
arch=(x86_64)
url="https://gitlab.freedesktop.org/pipewire/wireplumber"
license=(MIT)
source=("git+$url.git"
        $url/commit/80dc7723fcd9651eb8e1b6c4c86b30cb11ea1854.patch)
sha256sums=('SKIP'
            '267271abfc0525291483d6437bfb2b5c4a0e99404ec9d8476a7e210a6d8af0bd')
depends=(pipewire)
makedepends=(hotdoc)
conflicts=(wireplumber)
provides=(wireplumber=${pkgver%+*})

pkgver() {
  git -C wireplumber describe --abbrev=10 | sed 's/-/+/; s/-/./'
}

prepare() {
  # test/dbus-device-reservation: fix include path
  patch -sp1 -d wireplumber -i ../80dc7723fcd9651eb8e1b6c4c86b30cb11ea1854.patch

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
