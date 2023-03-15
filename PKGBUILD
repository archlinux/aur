# Maintainer: Gaetan Bisson <gaetan@fenua.org>
# Contributor: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-avx2
_pkgname=KataGo
pkgver=1.12.4
pkgrel=1
pkgdesc='AlphaZero-like open source Go bot, built for AVX2'
url='https://github.com/lightvector/KataGo'
provides=('katago')
arch=('x86_64')
license=('MIT')
depends=('libzip' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'eigen')
source=("git+https://github.com/lightvector/KataGo.git#tag=v${pkgver}"
	"https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b18c384nbt-s4975305984-d3174897359.bin.gz")
sha256sums=('SKIP'
            '67f1f3be9979c4188075d591066acbd916f40925162b3bf172a07749d4919b5a')

# For fast playouts on this CPU-bound katago, we ship the strongest neural
# network with reasonable number of blocks. See: https://katagotraining.org/

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule init
}

build() {
	cd "${srcdir}/${_pkgname}"
	cd cpp
	cmake . -DUSE_BACKEND=EIGEN -DUSE_AVX2=1
	make 
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 cpp/katago "${pkgdir}/usr/bin/katago"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/katago-cpu/LICENSE"
	install -d "${pkgdir}/usr/share/katago"
	cp ../kata1-*.gz "${pkgdir}/usr/share/katago"
}
