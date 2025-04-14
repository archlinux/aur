# Maintainer: Ren Tatsumoto <tatsu at autistici dot org>

# https://www.linux.org.ru/news/opensource/17078848?lastmod=1674731910604#comment-17086662
pkgname=crqt-ng
provides=(coolreader crqt-ng crqt-ng-git)
conflicts=(coolreader crqt-ng-git)
pkgver=1.0.15
_pkgver=${pkgver//_/-}
pkgrel=3
pkgdesc='Cross-platform open source e-book reader using crengine-ng.'
arch=('x86_64')
url='https://gitlab.com/coolreader-ng/crqt-ng'
license=('GPL-2')
depends=('crengine-ng' 'fribidi' 'hicolor-icon-theme' 'libunibreak' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'qt6-tools' 'clang')
source=("https://gitlab.com/coolreader-ng/${pkgname}/-/archive/${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('bbcfdece9b72958c3b9d8b894ffcf1e944d39b283d268984774dc32d8c45068d')

build() {
	cmake \
		-B "build" \
		-S "${pkgname}-${_pkgver}" \
		-W no-dev \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-D USE_QT=QT6 \
		-D CMAKE_POLICY_VERSION_MINIMUM=3.5 \
		-D CMAKE_BUILD_TYPE=Release
	make -C "build" all
}

package() {
	make -C "build" DESTDIR="$pkgdir" install
	install -D -m644 "${pkgname}-${_pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"

	mkdir -p "${pkgdir}/usr/lib/" # temp fix
	ln -s "/usr/lib/libunibreak.so" "${pkgdir}/usr/lib/libunibreak.so.5" # temp fix
}
