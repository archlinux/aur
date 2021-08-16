# Maintainer: Igor Dyatlov <dyatlov.igor@protonmail.com>

pkgname=share-preview-git
_pkgname=share-preview
pkgver=0.1.2.r10.gedc6058
pkgrel=4
pkgdesc="Preview and debug websites metadata tags for social media share."
arch=('any')
url="https://github.com/rafaelmardojai/share-preview"
license=('GPL3')
depends=('gtk4' 'libadwaita' 'glib2')
makedepends=('meson' 'rust' 'git')
checkdepends=('appstream-glib')
provides=("${pkgname%-git}" 'share-preview-bin')
conflicts=("${pkgname%-git}" 'share-preview-bin')
source=(git+$url.git)
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	arch-meson "${pkgname%-git}" build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
