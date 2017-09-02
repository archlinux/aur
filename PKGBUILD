# Maintainer: David Manouchehri
# Contributor: Alex Palaistras <alex+archlinux@deuill.org>
# Contributor: Elen Eisendle

_pkgname=binaryninja
pkgname="${_pkgname}-personal"
_branch=stable
pkgdesc="Binary Ninja is a binary multi-tool and reversing platform"
url="https://binary.ninja"
license=('custom:Binary Ninja License Agreement')
arch=('x86_64')
conflicts=("${_pkgname}")
provides=("${_pkgname}")

# https://binary.ninja/recover/
source=("file://BinaryNinja-personal.zip"
		"binaryninja-personal"
		"binaryninja.png"
		"binaryninja-personal.desktop")

_hash=$(curl -s https://binary.ninja/js/hashes.js | grep -m1 -oP '"BinaryNinja-personal.zip"\s*:\s*"\K[^"]+')

sha256sums=("${_hash}"
			'14025caefa4201062d7334505c56534dd237185f5ecdb4c20d7aad17c80647a7'
			'ac2e652f617d5ef8aaa34a5113164f51f3f673c872a635d29c93878a00650bf8'
			'36aea5c3f72563703b937b98381195de01084fcddacd6e4a3ed4bc48ae75c9a2')

# @TODO: Figure out what's really needed.
depends=('libcurl-compat')
makedepends=('git' 'curl')
pkgver=1.1.922
pkgrel=1

pkgver() {
	curl -s https://binary.ninja/js/changelog.js | grep -m1 -oP '"version"\s*:\s*"\K[^"]+' | head -1
}

package() {
	cd "${srcdir}/${_pkgname}"
	mkdir -v "${pkgdir}/opt"
	mkdir -v -p "${pkgdir}/usr/share/icons/hicolor/128x128/apps"
	mkdir -v -p "${pkgdir}/usr/share/applications"
	mkdir -v -p "${pkgdir}/usr/bin"

	mv -v "${srcdir}/binaryninja" "${pkgdir}/opt/binaryninja-personal"

	install -m644 "${srcdir}/binaryninja.png" "${pkgdir}/usr/share/icons/hicolor/128x128/apps/"
	install -m644 "${srcdir}/binaryninja-personal.desktop" "${pkgdir}/usr/share/applications/"
	install -m755 "${srcdir}/binaryninja-personal" "${pkgdir}/usr/bin"

	# Not a proper fix, but hey, it works.
	mv -v "${pkgdir}/opt/binaryninja-personal/plugins/libssl.so" "${pkgdir}/opt/binaryninja-personal/plugins/libssl.so.bak"

	ln -v -s "/usr/lib/libpython2.7.so" "${pkgdir}"/opt/binaryninja-personal/plugins/libpython2.7.so.1
}

# vim:set et sw=2 sts=2 tw=80:
