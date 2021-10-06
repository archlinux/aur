# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

_prefix=arm-none-eabi-
pkgname=${_prefix}yiolibc
pkgver=v0.2.4
pkgrel=1
pkgdesc="Yio Input Output C Library that aims in type-safe printf replacement"
arch=(any)
url="https://gitlab.com/kamcuk/yio/"
license=(GPL)
groups=()
depends=()
makedepends=(cmake m4 ${_prefix}gcc ${_prefix}newlib git)
optdepends=()
provides=(arm-none-eabi-yiolibc)
conflicts=()
replaces=()
backup=()
options=(!emptydirs !strip)
source=("git+https://gitlab.com/kamcuk/yio#tag=${pkgver}")
md5sums=(SKIP)

build() {
	${_prefix}gcc --print-multi-lib |
	while IFS=';' read -r dir opts; do
		opts=$(sed 's/@/ -/g' <<<"$opts")
		( set -x
		cmake \
			-B "build/$dir" \
			-S "yio" \
			-D CMAKE_TOOLCHAIN_FILE="$PWD/yio/cmake/Toolchain/${_prefix}gcc.cmake" \
			-D CMAKE_BUILD_TYPE="Release" \
			-D CMAKE_C_FLAGS_RELEASE="-Os -DNDEBUG -g -ffunction-sections -fdata-sections" \
			-D CMAKE_C_FLAGS="$opts" \
			-D CMAKE_INSTALL_LIBDIR="lib/$dir"
		cmake --build "build/$dir" --target yio
		cmake --build "build/$dir" --target yio_decimallib
		)
	done
}

package() {
	${_prefix}gcc --print-multi-lib |
	while IFS=';' read dir opts; do
		cmake --install "build/$dir" --prefix "$pkgdir/usr/arm-none-eabi/"
	done
}

check() {
	${_prefix}gcc --print-multi-lib |
	head -n1 |
	while IFS=';' read dir opts; do
		(
			tmp=$(mktemp)
			trap 'rm "$tmp"' EXIT
			set -x
			${_prefix}gcc --specs=rdimon.specs -L"build/$dir" -I"build/$dir" $opts -xc - -lyio -o "$tmp" <<'EOF'
#include <yio.h>
int main() {
	yprint("Hello world", 5, "\n");
}
EOF
		)
	done
}

