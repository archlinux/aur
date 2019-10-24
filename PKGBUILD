# Maintainer: Jon Nordby <jononor@gmail.com>
# CoMaintainer: bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

pkgname=mmm-git
pkgver=0.1.0.r22.a5b2321
pkgrel=1
pkgdesc="Shared memory protocol for virtualising access to framebuffer graphics, audio output and input event."
arch=(i686 x86_64)
url="https://github.com/hodefoting/mmm"
license=('custom')
depends=('alsa-lib' 'sdl2')
makedepends=('git' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
	#printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"}
}


build() {
	mkdir -p ${srcdir}/build
	meson ${srcdir}/${pkgname%-git} build --prefix=/usr
	NINJA_STATUS="[%p | %f<%r<%u | %cbps ] " ninja -C "${srcdir}/build"
}

package() {
	DESTDIR="${pkgdir}" ninja -C "${srcdir}/build" install
	install -Dm755 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/${pkgname%-git}/COPYING"
}
