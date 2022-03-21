# Maintainer: MoonlightSentinel <moonlightsentinel@disroot.org>

pkgname=har-git
pkgver=0.1.0.r15.gecf4f7d
pkgrel=1
pkgdesc="Utility to create / extract HAR (Human Archive Format) files"
arch=(x86_64)
# N.B.: Forked from marler8997/har due to inactivity
url="https://github.com/MoonlightSentinel/har"
license=('Boost')
makedepends=(git ldc)
provides=(har)
conflicts=(har)
source=( "git+${url}.git" )
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"

	# Build with full optimization. Statically link druntime / phobos
	# s.t. ldc (or rather libphobos) is a build-only dependency
	ldc2 harmain.d -of=har \
		-Isrc -i \
		-O3 -mcpu=native \
		-flto=full \
		-defaultlib="phobos2-ldc-lto,druntime-ldc-lto" \
		-link-defaultlib-shared=false \
		--function-sections -L--gc-sections
}

check() {
	cd "$srcdir/${pkgname%-git}"

	# Ensure that the test is reentrant
	mkdir -p extracted
	rm -f extracted/*

	./har --quiet --dir=extracted examples/files.har
	[ "$(ls -1q extracted/ | wc -l)" == "3" ]
	[ "$(cat extracted/hello.txt)" == 'Hello, this is a file currently archived in a HAR file.' ]
	[ "$(cat extracted/other.txt)" == 'This is another file also archived within the same HAR file.' ]
	[ "$(cat extracted/yetanother.txt)" == 'This is yet another file also archived within the same HAR file.' ]
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -D har -t "${pkgdir}/usr/bin"
}
