# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
pkgname=koku-xinput-wine-git
pkgver=1.2.1.r0.g11e7f4a
pkgrel=1
_srcname=koku-xinput-wine
pkgdesc="Adds xinput support to Wine without modifying the source binaries of Wine."
arch=('i686' 'x86_64')
url="https://www.github.com/KoKuToru/koku-xinput-wine"
license=('custom:BSD2')
provides=("${pkgname[0]%-git}")
conflicts=("${pkgname[0]%-git}")

makedepends=('git' 'cmake' 'wine')
makedepends_x86_64=('gcc-multilib')
depends_x86_64=('lib32-sdl2')
depends_i686=('sdl2')

source=("${_srcname}::git+${url}.git")
md5sums=('SKIP')


pkgver() {
  cd "${_srcname}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${_srcname}"
  cmake .
  make
} 

package() {
	cd "${srcdir}/${_srcname}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/BSD2"
	if [ "$CARCH" == "x86_64" ]; then
		install -Dm755 koku-xinput-wine.so koku-xinput-wine64.so -t "${pkgdir}/usr/lib32/"
	else
		install -Dm755 koku-xinput-wine.so -t "${pkgdir}/usr/lib/"
	fi
}

