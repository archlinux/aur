# Maintainer: Omar Pakker <archlinux@opakker.nl>
# Contributor: AndyRTR <andyrtr@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_basepkgname=libxkbfile
pkgname=lib32-${_basepkgname}
pkgver=1.1.3
pkgrel=1
pkgdesc="X11 keyboard file manipulation library"
arch=('x86_64')
license=('LicenseRef-libxkbfile')
url="https://gitlab.freedesktop.org/xorg/lib/libxkbfile"
depends=('lib32-glibc' 'lib32-libx11' 'xorgproto')
makedepends=('lib32-gcc-libs' 'meson' 'xorg-util-macros')
source=(https://xorg.freedesktop.org/releases/individual/lib/${_basepkgname}-${pkgver}.tar.xz{,.sig})
sha512sums=('d80ac41f6fa3a1ffad77ea1f8f9d9542f0bd210d74b263802bc6e6c1594fe325b27f42b5454aeeb36352518963b1ed1fdbbad95d7db3690b2e36d54742b7c236'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') #Alan Coopersmith <alan.coopersmith@oracle.com>
#validpgpkeys=('3BB639E56F861FA2E86505690FDD682D974CA72A') # Matt Turner <mattst88@gmail.com>

build() {
	arch-meson "${_basepkgname}-${pkgver}" build --cross-file lib32
	meson configure build
	ninja -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir="${pkgdir}"
	rm -rf "${pkgdir}/usr/include"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
		"${_basepkgname}-${pkgver}/COPYING"
}
