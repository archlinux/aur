# Maintainer: sant0s <diego.delossantos@mailbox.org>
pkgname=livecaptions
_pkgname=LiveCaptions
pkgver=v0.4.1.r0.gdf0540a
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
		"https://april.sapples.net/april-english-dev-01110_en.april")
md5sums=('SKIP'
         '3151046bd9f80655117dd6c3a0ecdcb3')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_pkgname}"
	arch-meson . build
	meson compile -C build
}

check() {
  meson test -C ${_pkgname}/build --print-errorlogs
}

prepare() {
	cd "${_pkgname}"
	git checkout v${pkgver}
	git submodule update --init --recursive
	find . \( -name "*.c" -o -name "*.h" \) -type f -exec sed -i \
		 "s|/app/LiveCaptions/|/usr/share/${_pkgname}/|" {} \;
}

package() {
	mkdir -p "${pkgdir}/etc/profile.d/"
	mkdir -p "${pkgdir}/usr/share/${_pkgname}/models"

	meson install -C "${_pkgname}/build" --destdir "${pkgdir}"

	install -Dm644 "$_pkgname"/COPYING -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -Dm644 april-english-dev-01110_en.april -T "${pkgdir}/usr/share/${_pkgname}/models/aprilv0_en-us.april"
}
