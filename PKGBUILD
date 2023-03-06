# Maintainer: Luca Canavese <l.canavese@protonmail.com>
# Contributor: peace885 <reyadmin@gmail.com>
# Contributor: Thibault Boyeux <thibault.boyeux@gmail.com>
# Contributor: Army
# Contributor: Archer777
# Contributor: Dave Reisner <d@falconindy.com>
# Contributor: Karol Cichy <slothck@gmail.com>

_pkgname=conky
pkgname=conky-cli
pkgver=1.18.3
pkgrel=1
pkgdesc="Lightweight system monitor for X, without X11 dependencies"
url='https://github.com/brndnmtthws/conky'
license=('BSD' 'GPL')
arch=('x86_64')
provides=('conky')
conflicts=('conky')
makedepends=('cmake' 'docbook2x' 'docbook-xsl' 'man-db' 'git' 'catch2' 'python-yaml' 'python-jinja' 'xorgproto' 'libx11')
depends=('curl' 'lua' 'wireless_tools' 'libxml2')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/brndnmtthws/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")

sha256sums=('96755e1f8de852e2812e00c16050f5e98585bbe29c547edb4eb6d1e760081d93')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	# Unbundle catch2 to fix build with glibc 2.35
	rm -r tests/catch2
	ln -s /usr/include/catch2 tests
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"

	cmake \
		-B build \
		-D CMAKE_BUILD_TYPE=Release \
		-D BUILD_EXTRAS=ON \
		-D BUILD_HDDTEMP=OFF \
		-D BUILD_PORT_MONITORS=OFF \
		-D BUILD_X11=OFF \
		-D BUILD_WAYLAND=OFF \
		-D BUILD_XDAMAGE=OFF \
		-D BUILD_XFT=OFF \
		-D BUILD_WLAN=ON \
		-D CMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev \
		-S .

	make -C build
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make -C build DESTDIR="${pkgdir}" install
	install -Dm644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 build/extras/vim/syntax/conkyrc.vim -t "${pkgdir}"/usr/share/vim/vimfiles/syntax
	install -Dm644 extras/vim/ftdetect/conkyrc.vim -t "${pkgdir}"/usr/share/vim/vimfiles/ftdetect
}

# vim: ts=2 sw=2 et:
