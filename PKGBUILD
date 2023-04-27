# Maintainer: sant0s <diego.delossantos@mailbox.org>
pkgname=livecaptions
_pkgname=LiveCaptions
pkgver=0.4.0
pkgrel=1
pkgdesc="Linux Desktop application that provides live captioning"
arch=('x86_64')
url="https://github.com/abb128/LiveCaptions"
license=('GPL3')
depends=(
	'libadwaita'
	'onnxruntime'
)
makedepends=(
	git
	cmake
	ninja
	gcc
	meson
)
source=("${_pkgname}::git+https://github.com/abb128/${_pkgname}.git"
		"https://april.sapples.net/aprilv0_en-us.april")
md5sums=('SKIP'
         '7c64256f201268eca7bc0ee8ebb910c4')

build() {
	cd "${_pkgname}"
	git checkout v${pkgver}
	git submodule update --init --recursive
	arch-meson . build
	meson compile -C build
}

check() {
  meson test -C ${_pkgname}/build --print-errorlogs
}

prepare() {
	find "${_pkgname}" \( -name "*.c" -o -name "*.h" \) -type f -exec sed -i \
		 "s|/app/LiveCaptions/|/usr/share/${_pkgname}/|" {} \;
}

package() {
	mkdir -p "${pkgdir}/etc/profile.d/"
	mkdir -p "${pkgdir}/usr/share/${_pkgname}/models"

	meson install -C "${_pkgname}/build" --destdir "${pkgdir}"

	install -Dm644 "$_pkgname"/COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm644 aprilv0_en-us.april -t "${pkgdir}/usr/share/${_pkgname}/models"
}
