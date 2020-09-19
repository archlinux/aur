# Maintainer: nl6720 <nl6720@archlinux.org>
# Contributor: Jack Random <jack (@) random.to>
# Contributor: Jerome Leclanche <jerome.leclanche+arch@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

pkgbase=akonadi-git
pkgname=(akonadi-git libakonadi-git)
pkgver=20.08.1.r48.g5cc47ec9d
pkgrel=1
pkgdesc='PIM layer, which provides an asynchronous API to access all kind of PIM data'
arch=(x86_64)
url='https://kontact.kde.org'
license=(LGPL)
makedepends=(git extra-cmake-modules mariadb postgresql qt5-tools boost kitemmodels kaccounts-integration)
source=("git+https://invent.kde.org/pim/akonadi.git")
sha512sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'

}

prepare() {
	mkdir -p build
}

build() {
	cmake -B build -S "${pkgname%-git}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package_libakonadi-git() {
	pkgdesc='Libraries used by applications based on Akonadi'
	depends=(kitemmodels kaccounts-integration)
	conflicts=("${pkgname%-git}")
	provides=("${pkgname%-git}=${pkgver}")

	DESTDIR="$pkgdir" cmake --install build
	rm -r "$pkgdir"/usr/bin # Provided by akonadi
}

package_akonadi-git() {
	depends=(libakonadi-git)
	optdepends=('mariadb: MariaDB backend'
	            'postgresql: PostgreSQL backend'
	            'postgresql-old-upgrade: upgrade from previous major PostgreSQL version using pg_upgrade'
	            'sqlite: SQLite backend')
	conflicts=("${pkgname%-git}")
	provides=("${pkgname%-git}=${pkgver}")

	DESTDIR="$pkgdir" cmake --install build
	rm -r "$pkgdir"/{etc,usr/{include,lib,share}} # Provided by libakonadi
}
