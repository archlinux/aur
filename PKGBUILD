# Maintainer: Nova King <technobaboo@protonmail.com>

pkgname=libstardustxr-git
_pkgname=libstardustxr
pkgver=r274.bab53a2
pkgrel=1

pkgdesc="Client/Server libraries for Stardust XR, now including Fusion"
arch=('x86_64' 'aarch64' 'armv7l')
url="https://stardustxr.org/"
license=('MIT')

provides=('libstardustxr')
depends=('flatbuffers>=2.0.0')
makedepends=('git' 'meson')

source=(git+https://github.com/StardustXR/libstardustxr.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	arch-meson "libstardustxr" build -Dclient=true -Dserver=true -Dfusion=true
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm775 "libstardustxr/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
