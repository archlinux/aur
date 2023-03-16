pkgname=chromatic-git
pkgver=r21.fe9d34e
pkgrel=1
pkgdesc='Fine-tune your instruments'
arch=(any)
url=https://github.com/nate-xyz/${pkgname%-git}
license=(GPL3)
depends=(libadwaita rust)
makedepends=(git meson)
chrckdepends=(appstream-util)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+$url)
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i "s/'validate'/'validate-relax'/" ${pkgname%-git}/data/meson.build
}

build() {
  arch-meson ${pkgname%-git} build
  ninja -C build
}

check() {
  meson test -C build --print-errorlog
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
