# Maintainer: Omar Pakker <omar.pakker@oracle.com>

pkgname=ccminer-git
pkgver=r708.1b12472
pkgrel=1
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson')
makedepends=('git' 'gcc5')
provides=('ccminer')
conflicts=('ccminer')
options=('!emptydirs')
changelog=
source=("git://github.com/tpruvot/ccminer.git#branch=linux")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/ccminer"
	
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Workaround for CUDA not compiling with GCC 6
	mkdir -p "${srcdir}/gcc-bin-override"
	ln -sf "/usr/bin/gcc-5" "${srcdir}/gcc-bin-override/gcc"
	ln -sf "/usr/bin/g++-5" "${srcdir}/gcc-bin-override/g++"
	export PATH="${srcdir}/gcc-bin-override:${PATH}"
}

build() {
	cd "${srcdir}/ccminer"
	
	./autogen.sh
	./configure --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib --with-cuda=/opt/cuda
	make
}

package() {
	cd "${srcdir}/ccminer"
	
	make DESTDIR="${pkgdir}/" install
}

