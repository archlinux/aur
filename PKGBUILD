# Maintainer: Your Name <youremail@domain.com>
pkgname=obliviate-git
pkgver=r108.6936a6c
pkgrel=1
pkgdesc="A password manager that forgets your passwords"
arch=('x86_64')
url="https://github.com/elfenware/obliviate"
license=('GPL3')
depends=('glib2' 'granite' 'gtk3' 'libgcrypt')
makedepends=('meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+$url.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
  arch-meson ${pkgname%-git} build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
