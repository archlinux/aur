# Maintainer: Mike Kazantsev <mk.fraggod@gmail.com>

_p=re2g

pkgname=${_p}-git
pkgver=1
pkgrel=2
pkgdesc="A grep-alike built on re2 pcre-like fast regexp library."
arch=(i686 x86_64)
url='https://github.com/akamai/re2g'
license=(MIT)
depends=(re2)
makedepends=(git)
source=("${_p}::git+$url")
sha256sums=(SKIP)

_patches=( 0001_ondrik-re2g-0d906520.patch 0002_fix-makefile.patch )
for p in ${_patches[@]}; do source+=($p); sha256sums+=(SKIP); done

pkgver() {
	cd $_p
	printf "%s.%s.$pkgrel" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_p
	for p in ${_patches[@]}; do
		patch --dry-run -tNp1 -R -i "$srcdir"/$p >/dev/null \
			|| patch -tNp1 -i "$srcdir"/$p || { echo >&2 "ERROR: patch failed - $p"; exit 1; }
	done
}

build() {
	cd $_p
	make
}

package() {
	cd $_p
	make BINDIR="$pkgdir"/usr/bin install
}
