# Maintainer: trougnouf (Benoit Brummer) <trougnouf at gmail dot com>
pkgname='bm3d-gpu-git'
pkgver=r11.165b423
pkgrel=1
pkgdesc='CUDA implementation of BM3D'
url='https://github.com/DawyD/bm3d-gpu'
depends=('cuda')
makedepends=('cuda' 'gcc' 'libpng' 'clinfo')
license=('GPL3')
arch=('x86_64')
source=(git+"${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd bm3d-gpu
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
build() {
	cd "${srcdir}/bm3d-gpu"
	compute_capability=$(clinfo \
		| grep -oP '(Compute Capability\ \(NV\)\ *\K[0-9]*)(\.)([0-9]*)'\
		| tr -d .)
	sed -i 's~/usr/local/~/opt/~g' Makefile
	sed -i "s~sm_35~sm_${compute_capability}~" Makefile
	make
}


package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp "${srcdir}/bm3d-gpu/bm3d" "${pkgdir}/usr/bin"
}

