# Contributor: Lex Black <autumn-wind@web.de>

## GPG key: https://greenbone.net/GBCommunitySigningKey.asc

pkgname=gsad
pkgver=24.0.0
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
        0001-libgcrypt-config.patch
        0002-fix-unit-path.patch)
sha256sums=('c58acc1df722f0ef833d1ea718e44dc4f23a38ef914977efc306edb698080750'
            'SKIP'
            'e50f1fafd28a7253b55cb621fa036e047fe1412b051f331b58fdaddd9ab2a374'
            'fadbf71ca0659650a8f0316057eb71836e35d9be43de06bcdcfb542ca3ad5a3a')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/-Werror/d' CMakeLists.txt

	# libgcrypt-config got replaced
	# ToDo: issue @ upstream (same as done with openvas-scanner)
	patch -Np2 -i "${srcdir}"/0001-libgcrypt-config.patch
	# fix install path for unit file
	# ToDo: issue @ upstream (similar currently open for gvmd)
	patch -Np2 -i "${srcdir}"/0002-fix-unit-path.patch
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
		-DLOCALSTATEDIR=/var
	make -C build
}

package() {
	make DESTDIR="${pkgdir}/" -C build install
}
