# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: hexchain <i at hexchain dot org>

pkgname=tpm2-tss
pkgver=2.0.0
pkgrel=4
pkgdesc='TPM (Trusted Platform Module) 2.0 Software Stack (TSS)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('libgcrypt')
checkdepends=('cmocka>=1.0.0' # for unit test suite
              'ibm-sw-tpm2' 'net-tools' 'procps-ng' 'uthash') # for integration test suite
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('7dfd05f7d2c4d5339d1c9ecbdba25f4ea6df70e96b09928e15e0560cce02d525' 'SKIP')
validpgpkeys=('42007E876F248E04A3F2FE25AE4548D043DEC7C3') # Philip Tricca

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --disable-doxygen-doc
	make
}

check() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --disable-doxygen-doc --enable-unit --enable-integration
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
