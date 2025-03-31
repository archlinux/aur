# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=android-xml-converter
pkgname="$_pkgbase-git"
pkgver=1.r14.gca2d429
pkgrel=1
pkgdesc="Android Binary XML (ABX) conversion tools"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/rhythmcache/android-xml-converter"
license=('Apache-2.0')
depends=('clang')
makedepends=('git')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/rhythmcache/android-xml-converter.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbase"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd "$_pkgbase"
	rm -rf build
	mkdir build

	clang++ -Os -static -ffunction-sections -fdata-sections -fvisibility=hidden \
		-flto -Wl,--gc-sections -o "build/abx2xml" "abx2xml.cpp"

	clang++ -Os -static -ffunction-sections -fdata-sections -fvisibility=hidden \
		-flto -Wl,--gc-sections -o "build/xml2abx" "xml2abx.cpp"
}

package() {
	cd "$_pkgbase"

	install -Dm755 "build/abx2xml" "$pkgdir/usr/bin/abx2xml"
	install -Dm755 "build/xml2abx" "$pkgdir/usr/bin/xml2abx"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgbase/LICENSE"
}
