# Maintainer: Gaetan Bisson <gaetan@fenua.org>
# Contributor: flovo <flovo-git-commit at f-voegele dot de>

pkgname=katago-avx2
_pkgname=KataGo
pkgver=1.11.0
pkgrel=3
pkgdesc='AlphaZero-like open source Go bot, built for AVX2'
url='https://github.com/lightvector/KataGo'
provides=('katago')
arch=('x86_64')
license=('MIT')
depends=('libzip' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'eigen')
source=("git+https://github.com/lightvector/KataGo.git#tag=v${pkgver}"
	"https://media.katagotraining.org/uploaded/networks/models/kata1/kata1-b15c192-s1672170752-d466197061.txt.gz")
sha256sums=('SKIP'
            '09456899f1b9155217f4ca059cf8a68f79b7eba22cf6b7c00ffb7f17ce067967')

# To enable fast playouts on this CPU-bound katago, we ship the strongest
# 15-block, 192-channel neural network. See: https://katagotraining.org/

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
