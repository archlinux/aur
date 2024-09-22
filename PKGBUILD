# Contributor: Lex Black <autumn-wind@web.de>

## GPG key: https://greenbone.net/GBCommunitySigningKey.asc

pkgname=gsad
pkgver=22.12.0
pkgrel=2
pkgdesc='server talking to the Greenbone Vulnerability Management daemon (gvmd)'
arch=('x86_64')
url="https://github.com/greenbone/gsad"
license=('AGPL-3.0-only')
groups=('greenbone-vulnerability-manager')
depends=(
    'gvm-libs'
    'gnutls'
    'libgcrypt'
    'libmicrohttpd'
    'libglib-2.0.so'
    'libxml2.so'
    'zlib'
)
makedepends=('cmake' 'xmltoman')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname-$pkgver.tar.gz.asc::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc"
        gsad.service
        gsad
        0001-libgcrypt-config.patch)
sha256sums=('1edb62a5f79e874f36c0b5fc91d19e725fd19d81c53d096ab3e8db21e49b1899'
            'SKIP'
            '8288701c27081ad65d9f32043b35c17bc7ae4338d41330f1bf6c6f1b57ccaaf8'
            '0c0f157b83b8dc6c7f9c6a1b00b179d4c727dcb845ae4b0c09d43bac4fb4dbd8'
            'e50f1fafd28a7253b55cb621fa036e047fe1412b051f331b58fdaddd9ab2a374')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity
backup=("etc/default/gsad")


prepare() {
	cd "$pkgname-$pkgver"
	sed -i '/-Werror/d' CMakeLists.txt

	# libgcrypt-config got replaced
	# ToDo: issue @ upstream (same as done with openvas-scanner)
	patch -Np2 -i "${srcdir}"/0001-libgcrypt-config.patch
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

	install -d "$pkgdir"/etc/default
	install -m 644 "$srcdir"/gsad "$pkgdir"/etc/default
	install -d "$pkgdir"/usr/lib/systemd/system
	install -m 644 "$srcdir"/gsad.service "$pkgdir"/usr/lib/systemd/system
}
