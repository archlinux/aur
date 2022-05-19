# Maintainer: Gaetan Bisson <gaetan@fenua.org>
# Contributor: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-avx2
_pkgname=KataGo
pkgver=1.11.0
pkgrel=1
pkgdesc='AlphaZero-like open source Go bot, built for AVX2'
url='https://github.com/lightvector/KataGo'
provides=('katago')
arch=('x86_64')
license=('MIT')
depends=('libzip' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'eigen')

# Neural net from: https://katagotraining.org/
_nnet=kata1-b40c256-s11101799168-d2715431527.bin.gz

source=("git+https://github.com/lightvector/KataGo#tag=v${pkgver}"
        "https://media.katagotraining.org/uploaded/networks/models/kata1/${_nnet}")
sha256sums=('SKIP'
            'c67482ee3a0ef5cb3bca6aa145d7a82decd71ece412713f92315195f238ef1bb')

prepare() {
	cd "${srcdir}/${_pkgname}"
	git submodule init
}

build() {
	cd "${srcdir}/${_pkgname}"
	cd cpp
	cmake . -DBUILD_MCTS=1 -DUSE_BACKEND=EIGEN -DUSE_AVX2=1
	make 
}

package() {
	cd "${srcdir}/${_pkgname}"
	install -Dm755 cpp/katago "${pkgdir}/usr/bin/katago"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/katago-cpu/LICENSE"
	install -Dm644 "../${_nnet}" "${pkgdir}/usr/share/katago/model.gz"
}
