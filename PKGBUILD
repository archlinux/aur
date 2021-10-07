# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>
# Contributor: Gustavo Peredo <gustavomperedo@protonmail.com>

pkgname=fontdownloader-git
_pkgname=font-downloader
pkgver=r383.392ccff
pkgrel=1
pkgdesc="A simple GTK font downloader"
arch=('x86_64')
url="https://github.com/GustavoPeredo/font-downloader"
license=('GPL3')
depends=('gtk3' 'libhandy' 'python' 'python-gobject')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}" "font-downloader" "font-downloader-git")
conflicts=("${pkgname%-git}" "font-downloader" "font-downloader-git")
source=(git+$url.git)
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson $_pkgname build
  meson compile -C build
}

#check() {
#  meson test -C build
#}

package() {
  meson install -C build --destdir "$pkgdir"
}