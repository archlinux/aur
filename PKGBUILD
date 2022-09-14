# Maintainer: Rick <riyyi3 at gmail dot com>

_pkgname=manafiles
pkgname=manafiles-git
pkgver=r335.0e15bfe
pkgrel=1
pkgdesc='Config file and package tracking utility'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/riyyi/manafiles'
license=('MIT')
depends=('gcc-libs')
optdepends=('grep: package functionality'
			'pacman-contrib: package functionality')
makedepends=('cmake' 'git' 'gzip')
install="${_pkgname}.install"
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
	git -C "${_pkgname}" submodule update --init --recursive
	mkdir -p "${_pkgname}/build"
}

pkgver() {
	cd "${_pkgname}" || exit 1
	echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}/build" || exit 1
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ..
	cmake --build .
}

package() {
	cd "${_pkgname}" || exit 1
	cmake --build "build" --target install -- DESTDIR="${pkgdir}"

	install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
