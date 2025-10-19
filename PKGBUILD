# Contributor: Lex Black <autumn-wind@web.de>

## GPG key: https://greenbone.net/GBCommunitySigningKey.asc

pkgname=gsad
pkgver=24.6.0
pkgrel=1
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
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc"
        "gsad.tmpfiles")
sha256sums=('50e2a9d85f8730dc269e63980e11fa6a6f1f8c052e0643b8e8848cc3dc122207'
            'SKIP'
            '9d978e755f969c8635f1f729b38c2c116e20a954925322c33df1859cb3031f60')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # Greenbone Community Feed integrity key


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

	install -Dm 644 ${pkgname}.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/${pkgname}.conf
}
