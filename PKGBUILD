# Maintainer: Philip Abernethy<chais.z3r0@gmail.com>
pkgname=sdl2-jstest-git
_gitname=sdl-jstest
pkgver=27.2647ade
pkgver() {
	cd "${_gitname}"
#	printf "%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}
pkgrel=1
pkgdesc="Simple SDL joystick test application for the command line."
url="https://github.com/Grumbel/sdl-jstest"
arch=('x86_64' 'i686')
license=('GPLv3 or any later version')
depends=('sdl' 'ncurses' 'docbook2x')
makedepends=('git')
provides=('sdl2-jstest')
install="${pkgname}.install"

source=('sdl-jstest::git+https://github.com/Grumbel/sdl-jstest.git'
        'Makefile.patch'
	"${install}")
sha512sums=('SKIP'
            'bcdcffa4975b0fe5170ea869d005a36f7613c45623f51f52f13cd8f6c0bc67a5a1f069fdf2e8f1b18bb8abb877071060e1e33609643a892e9bdb30b181be07fc'
            '6700f472466f24dcabc9be55f23f9e872f724f66024ac831daa11e61b6a6f6938111de035a4572c935cb01e7539d823ff26d48cc193935c00944bd2da23e3fcf')

build() {
	cd "${srcdir}/${_gitname}"
	patch < "${srcdir}/${source[1]}"
	make ${provides[0]} ${provides[0]}.1
}

package() {
	install -Dm755 "${srcdir}/${_gitname}/${provides[0]}" "${pkgdir}/usr/bin/${provides[0]}"
	install -dm755 "${pkgdir}/usr/share/man/man1"
	gzip -c "${srcdir}/${_gitname}/${provides[0]}.1" > "${pkgdir}/usr/share/man/man1/${provides[0]}.1.gz"
}
