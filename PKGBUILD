# Maintainer: <thysupremematrix attt tuta dotttt io>
_pkgname=flying-toasters-xscreensaver
pkgname=xscreensaver-flying-toasters-git
pkgver=1.2.0.r0.g1c1e4e6
pkgrel=2
pkgdesc="Classic After Dark screensaver recreation for XScreensaver."
arch=("x86_64")
url="https://github.com/torunar/flying-toasters-xscreensaver"
license=('MIT')
depends=("xscreensaver" "libxpm" "libx11" "glibc")
makedepends=("git")
source=(git+https://github.com/torunar/flying-toasters-xscreensaver.git)
install="flying-toasters.install"
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
  	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	sed -i 's/\(gcc -o bin\/flying-toasters src\/flying-toasters\.c -L\/usr\/lib -lX11 -lXpm -s -W -Wall\)/\1 -Wl,-z,relro,-z,now/gI' Makefile # Add full RELRO per https://wiki.archlinux.org/title/Arch_package_guidelines/Security
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 bin/flying-toasters "${pkgdir}/usr/bin/flying-toasters"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
