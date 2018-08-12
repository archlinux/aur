# Maintainer: Jonas Witschel <diabonas at gmx dot de>
# Contributor: hexchain <i at hexchain dot org>

pkgname=tpm2-tss
pkgver=2.0.1
pkgrel=1
pkgdesc='TPM (Trusted Platform Module) 2.0 Software Stack (TSS)'
arch=('x86_64')
url='https://github.com/tpm2-software/tpm2-tss'
license=('BSD')
depends=('libgcrypt')
checkdepends=('cmocka>=1.0.0' # for unit test suite
              'ibm-sw-tpm2' 'net-tools' 'procps-ng' 'uthash') # for integration test suite
source=("$url/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
sha256sums=('a53b25214375a10d87d0c0b0a702a3402c1f19e218196d4a2a44810516b260e5'
            'SKIP')
validpgpkeys=('42007E876F248E04A3F2FE25AE4548D043DEC7C3'  # Philip Tricca
              'D760B790CCF0A41CBE7B047C316CC1FB24ABDC72') # Tadeusz Struk

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --enable-unit --enable-integration
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
