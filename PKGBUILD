# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Omar Pakker <omar.pakker@oracle.com>

pkgname=ccminer
pkgver=1.7.6
pkgrel=1
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson')
makedepends=('git' 'gcc5')
conflicts=('ccminer-git')
options=('!emptydirs')
source=("https://github.com/tpruvot/ccminer/archive/${pkgver}-tpruvot.tar.gz")
md5sums=('382b2f1e49e583dd7c9489ce35f87fda')

prepare() {
	# Workaround for CUDA not compiling with GCC 6
	mkdir -p "${srcdir}/gcc-bin-override"
	ln -sf "/usr/bin/gcc-5" "${srcdir}/gcc-bin-override/gcc"
	ln -sf "/usr/bin/g++-5" "${srcdir}/gcc-bin-override/g++"
	export PATH="${srcdir}/gcc-bin-override:${PATH}"
}

build() {
	cd "${srcdir}/ccminer-${pkgver}-tpruvot"

	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib --with-cuda=/opt/cuda
	make
}

package() {
	cd "${srcdir}/ccminer-${pkgver}-tpruvot"

	make DESTDIR="${pkgdir}/" install
	install -Dm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
