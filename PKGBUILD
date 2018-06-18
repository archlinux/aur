# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Omar Pakker <omar.pakker@oracle.com>

pkgname=ccminer
pkgver=2.2.6
pkgrel=1
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson' 'openssl-1.0' 'nvidia-utils')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/tpruvot/ccminer/archive/${pkgver}-tpruvot.tar.gz")
sha256sums=('c48b027b3d511cdd8280d4e4ee2038c22e98967d2a97facea6678e712b44c8f5')

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
