# Maintainer: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Contributor: Alex Smith <azphreal19@protonmail.com

pkgname=koel
pkgver=3.7.2
pkgrel=3
pkgdesc="A personal music streaming server that works."
arch=('any')
url="http://koel.phanan.net/"
license=('MIT')
depends=('php' 'python3')
makedepends=('php-composer' 'nodejs-lts-carbon' 'yarn')
optdepends=('php-pgsql: to use the PostGreSQL database backend'
            'php-sqlsrv: to use the Microsoft SQL database backend'
            'mariadb: to use the MySQL database backend'
            'postgresql: to use the PostGreSQL database backend')

backup=('usr/share/webapps/koel/.env')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/phanan/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('b3ae40db2839f9b411716428203f595ca685ea2d87599c0704fb271446126c998a96cecb21d864d0269f41f23e9b16c0202f95647eee82ecc7d8c16fe49874ed')

prepare() {
	sed -i 's|FFMPEG_PATH=/usr/local/bin/ffmpeg|FFMPEG_PATH=/usr/bin/ffmepg/' "${srcdir}/${pkgname}-${pkgver}/.env"
}

build() {
	cd "$pkgname-$pkgver"
	COMPOSER_CACHE_DIR="${srcdir/composer}" composer install
	yarn install
}

package() {
	mkdir -p "${pkgdir}/usr/share/webapps"
	cp -r "${pkgname}-${pkgver}" "${pkgdir}/usr/share/webapps/${pkgname}"
}
