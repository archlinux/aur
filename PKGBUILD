# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=ccminer-git
pkgver=r876.5aa50a4
pkgrel=1
pkgdesc="Coin miner using CUDA for nVidia GPUs."
arch=('x86_64')
url="http://ccminer.org/"
license=('GPL3')
depends=('cuda' 'curl' 'jansson' 'openssl-1.0')
makedepends=('git' 'cuda' 'openssl-1.0')
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

build() {
	cd "${srcdir}/ccminer"

	./autogen.sh

	./configure CPPFLAGS='-I/usr/include/openssl-1.0' LDFLAGS='-L/usr/lib/openssl-1.0' \
		CUDA_CFLAGS='--shared --compiler-options "-fPIC"' \
		--prefix=/usr --sysconfdir=/etc --libdir=/usr/lib --with-cuda=/opt/cuda

	make
}

package() {
	cd "${srcdir}/ccminer"

	make DESTDIR="${pkgdir}/" install
}
