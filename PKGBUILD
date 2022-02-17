# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>


pkgname=yiolibc
pkgver=v0.3.1
pkgrel=1
pkgdesc="Yio Input Output C Library that aims in type-safe printf replacement"
arch=(any)
url="https://gitlab.com/kamcuk/yio/"
license=('GPL')
groups=()
depends=()
makedepends=(cmake m4 libunistring git)
optdepends=('libunistring: unicode support')
provides=(yiolibc)
conflicts=()
replaces=()
backup=()
options=()
source=("git+https://gitlab.com/kamcuk/yio#tag=${pkgver}")
md5sums=(SKIP)

build() {
	cmake \
		-B "build" \
		-S "yio" \
		-D CMAKE_BUILD_TYPE="Release" \
		-D CMAKE_C_FLAGS_RELEASE="-O2 -DNDEBUG -g -ffunction-sections -fdata-sections"
	cmake --build build
}

package() {
	cmake --install "build" --prefix "$pkgdir/usr"
}

check() {
	(
		tmpf=$(mktemp)
		trap 'rm "$tmpf"' EXIT
		set -x
		gcc -L"build/src" -I"build/gen" -xc - -lyio -lunistring -o "$tmpf" <<'EOF' && tmp=$("$tmpf") && <<<"$tmp" grep -xc 'Hello world 5'
#include <yio.h>
int main() {
	yprint("Hello world ", 5, "\n");
}
EOF
	)
}

