# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Omar Pakker <omar.pakker@oracle.com>

pkgname=ccminer
pkgver=2.1
pkgrel=1
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson' 'openssl-1.0' 'nvidia-utils')
options=('!emptydirs')
source=("https://github.com/tpruvot/ccminer/archive/v${pkgver}-tpruvot.tar.gz")
sha256sums=('500bf75aee42e48ed26e448963fa12d8d6df1b3e2cc38b8a4bf121d581ca3c9a')

build() {
	cd "${srcdir}/ccminer-${pkgver}-tpruvot"
	./autogen.sh
	./configure \
	    CPPFLAGS='-I/usr/include/openssl-1.0' \
	    LDFLAGS='-L/usr/lib/openssl-1.0' \
	    CUDA_CFLAGS='--shared --compiler-options "-fPIC"' \
	    --prefix=/usr \
	    --sysconfdir=/etc \
	    --libdir=/usr/lib \
	    --with-cuda=/opt/cuda
	make
}

package() {
	cd "${srcdir}/ccminer-${pkgver}-tpruvot"
	make DESTDIR="${pkgdir}/" install
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
