# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=libjsonschema-git
pkgver=r169.f666027
pkgrel=1
pkgdesc=''
url='https://codeberg.org/emersion/libjsonschema'
arch=('x86_64')
license=('MIT')
source=("git+$url.git")
sha1sums=('SKIP')
depends=()
makedepends=(git meson ninja)
conflicts=(libjsonschema)
provides=(libjsonschema libjsonschema.so)

pkgver() {
  # TODO: switch to tag once an initial release is shipped
  #git -C libjsonschema describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  cd libjsonschema
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson libjsonschema build
  ninja -C build
}

check() {
  ninja -C build test
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "libjsonschema/LICENSE"
}
