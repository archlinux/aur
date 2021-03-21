# Maintainer: Cain Atkinson <yellowsink@protonmail.com>

_pkgname="osu-tunes"
pkgname="${_pkgname}-git"
pkgver=r5.9c18074
pkgrel=1
pkgdesc="An audio player using osu! beatmaps"
arch=('x86_64')
url="https://github.com/cainy-a/osu-tunes"
license=('BSD')
groups=()
depends=('csfml')
makedepends=('git' 'nim' 'nimble' 'clang')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
backup=("usr/share/${_pkgname}/data")
source=("${_pkgname}-source::git+${url}#commit=9c18074b50e78f5977e34c20863b9fe602fd56ae")
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
	patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

pkgver() {
	cd "${_pkgname}-source"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# install deps
	nimble install csfml zip
}

build() {
	cd "${_pkgname}-source"

	# build with nim
	nim c -d:ssl OsuTunes.nim
}

#check() {
#	cd "$srcdir/${pkgname%-VCS}"
#	make -k check
#}

package() {
	cd "${_pkgname}-source"

	# install license
	install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
	
	# install built binary
	install -Dm 755 "OsuTunes" "${pkgdir}/usr/bin/${_pkgname}"
}
