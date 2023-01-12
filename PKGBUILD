# Maintainer: Robin Candau <robincandau[at]protonmail[dot]com>

pkgname=clipboard-git
_pkgname="${pkgname%-git}"
pkgver=0.2.1r2.r397.24e3404
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (git version)."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'cmake')
optdepends=('libx11: X11 support'
	    'wayland: Wayland support')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "%s.r%s.%s" "$(git describe --tags --abbrev=0 | sed 's/^v//')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build () {
        cmake -B build -S "${_pkgname}" \
                -DCMAKE_BUILD_TYPE='None' \
                -DCMAKE_INSTALL_PREFIX='/usr' \
                -DCMAKE_C_FLAGS=-DNDEBUG \
                -DCMAKE_CXX_FLAGS=-DNDEBUG \
                -Wno-dev
        cmake --build build
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/cb"
}
