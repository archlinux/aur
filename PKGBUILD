# Maintainer: nl6720 <nl6720@gmail.com>
# Contributor: Jack Random <jack (@) random.to>
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=akonadi-git
pkgname=(akonadi-git libakonadi-git)
pkgver=19.04.2.r97.g7f39ff12d
pkgrel=1
pkgdesc="PIM layer, which provides an asynchronous API to access all kind of PIM data"
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL)
makedepends=(git extra-cmake-modules mariadb postgresql qt5-tools boost kdesignerplugin kio kitemmodels)
source=("git+https://anongit.kde.org/akonadi.git")
sha256sums=('SKIP')
validpgpkeys=(CA262C6C83DE4D2FB28A332A3A6A4DB839EAA6D7  # Albert Astals Cid <aacid@kde.org>
              F23275E4BF10AFC1DF6914A6DBD2CE893E2D1C87) # Christoph Feck <cfeck@kde.org>

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../"${pkgname%-git}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF
	make
}

package_libakonadi-git() {
	pkgdesc='Libraries used by applications based on Akonadi'
	depends=(kio kitemmodels hicolor-icon-theme)
	conflicts=("${pkgname%-git}")
	provides=("${pkgname%-git}=${pkgver}")

	cd build
	make DESTDIR="$pkgdir" install
	rm -r "$pkgdir"/usr/bin # Provided by akonadi
}

package_akonadi-git() {
	depends=(libakonadi)
	optdepends=('mariadb: MariaDB backend')
	optdepends=('postgresql: PostgreSQL backend')
	conflicts=("${pkgname%-git}")
	provides=("${pkgname%-git}=${pkgver}")

	cd build
	make DESTDIR="$pkgdir" install
	rm -r "$pkgdir"/{etc,usr/{include,lib,share}} # Provided by libakonadi
}
