# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-git
_pkgname="${pkgname%-git}"
pkgver=0.8.1.r1732.263df73
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (git version)."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://getclipboard.app"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('alsa-lib')
makedepends=('git' 'cmake' 'libx11' 'wayland' 'wayland-protocols')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support'
	    'wayland-protocols: Wayland support')
source=("${_pkgname}::git+https://github.com/Slackadays/Clipboard.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
        export CFLAGS="${CFLAGS} -DNDEBUG"
        export CXXFLAGS="${CXXFLAGS} -DNDEBUG"

        cmake -B build -S "${_pkgname}" \
                -DCMAKE_BUILD_TYPE='None' \
                -DCMAKE_INSTALL_PREFIX='/usr' \
                -Wno-dev
        cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build

	cd "${_pkgname}"
	install -Dm 644 documentation/manpages/man.md "${pkgdir}/usr/share/doc/${_pkgname}/man.md"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
