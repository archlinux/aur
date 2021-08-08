# Maintainer: Nova King <technobaboo@protonmail.com>

pkgname=libstardustxr-fusion-git
_pkgname=libstardustxr
pkgver=r159.62ea8d5
pkgrel=1

pkgdesc="High level C++ client library for Stardust XR"
arch=('x86_64' 'aarch64' 'armv7l')
url="https://stardustxr.org/"
license=('MIT')

provides=('libstardustxr-fusion')
depends=('libstardustxr' 'flatbuffers>=1.12.0')
makedepends=('git' 'meson' 'ninja')

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
	arch-meson "libstardustxr" build -Dclient=false -Dserver=false
	meson compile -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
	install -Dm775 "libstardustxr/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
