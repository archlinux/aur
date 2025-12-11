# Maintainer: silverhikari <kerrickethan@gmail.com
pkgname=zix-git
pkgver=0.8.1.r642.e1cbd66
pkgrel=2
epoch=1
pkgdesc="A lightweight C library of portability wrappers and data structures"
arch=('any')
url="https://github.com/drobilla/zix"
license=('ISC')
makedepends=('git' 'meson')
provides=("${pkgname%-git}" "${pkgname%-git}=${pkgver//.r*/}")
conflicts=("${pkgname%-git}")
source=("git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	local ver=$(grep -E "^\s+version: '[0-9]+\.[0-9]+\.[0-9]+'" meson.build | cut -d "'" -f 2)
	echo $ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	arch-meson ${pkgname%-git} build -Ddocs=disabled
	meson compile -C build
}

package() {
	provides+=(libzix-0.so)
	meson install -C build --destdir "$pkgdir"
	install -Dm644 "${pkgname%-git}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 ${pkgname%-git}/{NEWS,README.md} -t "$pkgdir"/usr/share/doc/$pkgname
}
