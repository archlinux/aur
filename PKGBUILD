# Maintainer: Alistair Barrow <a.[SURNAME].a@gmail.com>

_pkgname=imlib2-jxl
pkgname="${_pkgname}-git"
pkgver=0.1r18.g036501d
pkgrel=1
pkgdesc="JPEG XL loader for imlib2 (git version)"
arch=(x86_64)
url="https://github.com/alistair7/$_pkgname"
license=(BSD)
depends=(imlib2 libjxl-git lcms2)
makedepends=(git)
# Conflicts with any non-git version
conflicts=("$_pkgname")
source=("git+https://github.com/alistair7/$_pkgname.git")
md5sums=(SKIP)

pkgver() {
	cd "$_pkgname"
	(
		LATEST_TAG="$(git describe --long --tags 2>/dev/null | sed -r 's/^v?([0-9.]+).*$/\1/')"
		[ -z "$LATEST_TAG" ] && LATEST_TAG=0
		set -o pipefail
		printf "%sr%s.g%s" "$LATEST_TAG" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "$_pkgname"
	make RELEASE_CFLAGS="$CFLAGS"
}

package() {
	cd "$_pkgname"
	install -Dm644 jxl.so "$pkgdir$(pkg-config imlib2 --variable=libdir)/imlib2/loaders/jxl.so"
	install -Dm644 LICENSE-BSD-ab -t "$pkgdir/usr/share/licenses/$pkgname"
}
