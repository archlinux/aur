# Maintainer: Robin Candau <antiz@archlinux.org>

pkgname=clipboard-git
_pkgname="${pkgname%-git}"
pkgver=0.3.0.r565.8c83e9a
pkgrel=1
pkgdesc="Cut, copy, and paste anything in your terminal (git version)."
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/Slackadays/Clipboard"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'cmake')
optdepends=('libx11: X11 support'
	    'wayland-protocols: Wayland support')
source=("${_pkgname}::git+${url}.git")
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
	ln -s "/usr/bin/${_pkgname}" "${pkgdir}/usr/bin/cb"

	cd "${_pkgname}"
	install -Dm 644 documentation/manpages/man.1 "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
	install -Dm 644 documentation/manpages/man.md "${pkgdir}/usr/share/doc/${_pkgname}/man.md"
	install -Dm 644 README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
