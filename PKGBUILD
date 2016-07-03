# Maintainer: Manuel Coenen <manuel dot coenen at gmail dot com>
pkgname=si4010prog-git
pkgver=r49.f312bcd
pkgrel=2
pkgdesc="A tool to program and debug the Silicon Labs SI4010 micro controller."
arch=('any')
url="https://github.com/dimhoff/si4010prog"
license=('GPL2')
makedepends=('git'
'cmake'
'make'
'gcc')
optdepends=('c2_gpio-dkms-git: accessing the si4010 chip via GPIO')
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/dimhoff/si4010prog.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}/build"
	rm -rf *
	cmake \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DWITH_C2_BUS_FX2=OFF \
		-DWITH_C2_BUS_FT232=OFF \
		-DWITH_C2_BUS_C2DRV=ON \
		../
	make
}

package() {
	cd "$srcdir/${pkgname%-git}/build/src"
	install -Dm755 si4010prog "${pkgdir}"/usr/bin/si4010prog
	install -Dm755 ec2_emul "${pkgdir}"/usr/bin/ec2_emul
}

# vim:set ts=2 sw=2 ft=sh et:
