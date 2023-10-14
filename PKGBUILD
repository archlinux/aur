# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard
_pkgname=Clipboard
pkgver=0.8.3
pkgrel=2
pkgdesc="Cut, copy, and paste anything in your terminal."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://getclipboard.app"
license=('GPL3')
depends=('alsa-lib')
makedepends=('cmake' 'libx11' 'wayland' 'wayland-protocols')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Slackadays/Clipboard/archive/${pkgver}.tar.gz"
        "fix_string_view_error.patch")
sha256sums=('d2f13e66e4b45d2084e2f88b992b36f07faf649fa1a1c5e0acfca303270a988c'
            'f9a5852ac44058644816214ba4a294b728c0415054e7dd3e9079e364f2e7c2cd')

prepare() {
	cd "${_pkgname}-${pkgver}"

	# Temporary patch to fix build
	# https://github.com/Slackadays/Clipboard/issues/168
	# https://github.com/Slackadays/Clipboard/commit/ac5982df045034f60e73d0ef81a3fe9ed3225c6b
	patch -Np1 < "${srcdir}/fix_string_view_error.patch"
}

build() {
        export CFLAGS="${CFLAGS} -DNDEBUG"
        export CXXFLAGS="${CXXFLAGS} -DNDEBUG"
	
	cmake -B build -S "${_pkgname}-${pkgver}" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev
	cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	cd "${_pkgname}-${pkgver}"
	install -Dm 644 documentation/manpages/man.md "${pkgdir}/usr/share/doc/${pkgname}/man.md"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
