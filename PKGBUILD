# Maintainer: Kirill Zhumarin <kirill.zhumarin@gmail.com>
pkgname=vasm-git
pkgver=2.0f.r0.g7afae7e
pkgrel=1
pkgdesc='Portable and retargetable assembler (git version)'
arch=(x86_64)
url='https://github.com/siemens-mobile-hacks/vasm'
license=(custom)
depends=(glibc)
makedepends=(git)
provides=(vasm)
conflicts=(vasm)
source=(git+https://github.com/siemens-mobile-hacks/vasm.git)
sha256sums=(SKIP)

pkgver() {
	cd vasm
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd vasm

	local cpu syntax
	for cpu in cpus/*; do
		cpu=${cpu##*/}
		for syntax in std madmac mot oldstyle; do
			make CPU="$cpu" SYNTAX="$syntax" \
				CC="gcc $CPPFLAGS" \
				CFLAGS="$CFLAGS -c -std=c90 -pedantic -Wno-long-long -DUNIX" \
				LDFLAGS="$LDFLAGS -lm"
		done
	done
}

package() {
	cd vasm
	install -d "$pkgdir/usr/bin"
	install -m755 vasm*_{std,madmac,mot,oldstyle} vobjdump "$pkgdir/usr/bin"
}
