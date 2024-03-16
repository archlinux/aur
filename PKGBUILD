# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

# https://www.linux.org.ru/news/opensource/17078848?lastmod=1674731910604#comment-17086662
pkgname=crqt-ng
provides=(coolreader crqt-ng crqt-ng-git)
conflicts=(coolreader crqt-ng-git)
pkgver=1.0.13
_pkgver=${pkgver//_/-}
pkgrel=1
pkgdesc='Cross-platform open source e-book reader using crengine-ng.'
arch=('x86_64')
url='https://gitlab.com/coolreader-ng/crqt-ng'
license=('GPL-2')
depends=('crengine-ng' 'fribidi' 'hicolor-icon-theme' 'libunibreak' 'qt6-base')
makedepends=('cmake' 'qt6-tools')
source=("https://gitlab.com/coolreader-ng/${pkgname}/-/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('234175758d5f07e522c6d6a787b8623bfc80e9120d17be6f66274596e909ef77')

build() {
	cmake \
		-B "build" \
		-S "${pkgname}-${_pkgver}" \
		-DCMAKE_INSTALL_PREFIX:PATH='/usr' \
		-DUSE_QT=QT6 \
		-DCMAKE_BUILD_TYPE=Release
	make -C "build" all
}

package() {
	make -C "build" DESTDIR="$pkgdir" install
	install -D -m644 "${pkgname}-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

	mkdir -p "${pkgdir}/usr/lib/" # temp fix
	ln -s "/usr/lib/libunibreak.so" "${pkgdir}/usr/lib/libunibreak.so.5" # temp fix
}
