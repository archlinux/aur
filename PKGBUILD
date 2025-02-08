# Contributor: Lex Black <autumn-wind@web.de>

## GPG key: https://greenbone.net/GBCommunitySigningKey.asc

pkgname=gsad
pkgver=24.2.0
pkgrel=2
pkgdesc='server talking to the Greenbone Vulnerability Management daemon (gvmd)'
arch=('x86_64')
url="https://github.com/greenbone/gsad"
license=('AGPL-3.0-only')
groups=('greenbone-vulnerability-manager')
depends=(
    'gvmd'
    'gvm-libs'
    'gnutls'
    'libgcrypt'
    'libmicrohttpd'
    'libglib-2.0.so'
    'libxml2.so'
    'zlib'
)
makedepends=('cmake' 'xmltoman')
optdepends=('logrotate: for rotating logs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('0d64248138199232694879c967a5eae41002be0330b62664bb93d84bcada3cfa'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/-Werror/d' CMakeLists.txt
}

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DSBINDIR=/usr/bin \
		-DLIBDIR=/usr/lib \
		-DSYSCONFDIR=/etc \
		-DLOCALSTATEDIR=/var \
		-DGVMD_RUN_DIR=/run/gvmd \
		-DGSAD_RUN_DIR=/run/gsad
	make -C build
}

package() {
	make DESTDIR="${pkgdir}/" -C build install
}
