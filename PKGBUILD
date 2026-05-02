# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=dav2d-git
pkgver=0.0.1.r3.ge4a4fb2
pkgrel=1
#pkgdesc="dav2d is an AV2 cross-platform decoder"
arch=('x86_64')
url="https://code.videolan.org/videolan/dav2d"
license=('BSD-2-Clause')
provides=("${pkgname::-4}")
conflicts=("${pkgname::-4}")
depends=('glibc')
makedepends=('meson' 'ninja' 'nasm' 'git')
source=("git+https://code.videolan.org/videolan/dav2d.git")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${srcdir}/${pkgname::-4}"
	git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}/"
	#meson subprojects download --sourcedir=${pkgname}-${pkgver} #check currently fails
}

build() {
	cd "${srcdir}"
	arch-meson build "${pkgname::-4}"
	meson compile -C build
}

check() {
	cd "${srcdir}"
	#meson test -C build check currently fails to compile
}

package() {
	cd "${srcdir}"
	meson install -C build --destdir "$pkgdir"
	install -Dm644 ${pkgname::-4}/COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
