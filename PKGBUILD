# Maintainer: Holger Schramm <dev@strace.it>
# Contributor: Philip Abernethy<chais.z3r0@gmail.com>

pkgname=sdl2-jstest-git
_gitname=sdl-jstest
pkgver=r82.aafbdb1
pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#	echo r.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
pkgrel=1
pkgdesc="Simple SDL joystick test application for the command line."
url="https://gitlab.com/sdl-jstest/sdl-jstest.git"
arch=('x86_64' 'i686' 'aarch64')
license=('GPLv3 or any later version')
depends=('sdl' 'sdl2' 'ncurses')
makedepends=('git' 'cmake' 'docbook2x')
provides=('sdl2-jstest')

source=('sdl-jstest::git+https://gitlab.com/sdl-jstest/sdl-jstest.git')
sha512sums=('SKIP')

build() {
	cd "${srcdir}/${_gitname}"
	git submodule update --init --remote --recursive
	cmake ./
	make ${provides[0]}
}

package() {
	install -Dm755 "${srcdir}/${_gitname}/${provides[0]}" "${pkgdir}/usr/bin/${provides[0]}"
	install -dm755 "${pkgdir}/usr/share/man/man1"
	gzip -c "${srcdir}/${_gitname}/${provides[0]}.1" > "${pkgdir}/usr/share/man/man1/${provides[0]}.1.gz"
}
