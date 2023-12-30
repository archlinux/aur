# Maintainer: Gaetan Bisson <gaetan@fenua.org>
# Contributor: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-avx2
_pkgname=KataGo
pkgver=1.14.0
pkgrel=1
pkgdesc='Strong open-source self-play-trained Go engine'
url='https://github.com/lightvector/KataGo'
provides=('katago')
arch=('x86_64')
license=('MIT')
depends=('libzip' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'eigen')
source=("git+https://github.com/lightvector/KataGo.git#tag=v${pkgver}"
        'https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b18c384nbt-s8526915840-d3929217702.bin.gz')
sha256sums=('SKIP'
            '8e094b75f3a5c20ab943da8ca072a48a16e32013c7a9eb2a8686dc0b72fa0ad6')

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
	cp ../kata1-*.gz "${pkgdir}/usr/share/katago/model.gz"
}
