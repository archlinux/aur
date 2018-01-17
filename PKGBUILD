# Maintainer: William Hight

_pkgname='ccminer'
pkgname="${_pkgname}-nanashi-git"
pkgver=r9.5ff7b99
pkgrel=1
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson' 'nvidia-utils' 'openssl-1.0' 'libcurl-openssl-1.0')
makedepends=('git' 'cuda' 'nvidia-utils' 'gcc6')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!emptydirs')
source=("git+https://github.com/wrhight/ccminer-nanashi.git")
sha256sums=('SKIP')

pkgver() {
	cd "ccminer-nanashi"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "ccminer-nanashi"

	./autogen.sh
	./configure \
	    CPPFLAGS='-I/usr/include/openssl-1.0' \
	    LDFLAGS='-L/usr/lib/openssl-1.0 -L/usr/lib/libcurl-openssl-1.0' \
	    CUDA_CFLAGS='--shared --compiler-options "-fPIC"' \
	    --prefix=/usr \
	    --sysconfdir=/etc \
	    --libdir=/usr/lib \
	    --with-cuda=/opt/cuda
	make -j 4
}

package() {
	cd "ccminer-nanashi"

	make DESTDIR="${pkgdir}" install
}

