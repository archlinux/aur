# Maintainer: Valerii Huz <ghotrix at gmail dot com>
pkgname=lczero-nvidia-git
_pkgname=leela-chess
pkgver=0.7
pkgrel=237
pkgdesc="This is an adaptation of GCP's Leela Zero repository to chess, using Stockfish's position representation and move generation."
arch=('i686' 'x86_64')
url="https://github.com/glinscott/leela-chess"
license=('GPLv3')
depends=('glibc' 'zlib' 'libopenblas' 'boost' 'opencl-nvidia')
makedepends=('git' 'opencl-headers' 'cmake' 'ocl-icd')
source=("${_pkgname}::git+https://github.com/glinscott/leela-chess")
md5sums=('SKIP')

prepare() {
    cd ${srcdir}/${_pkgname}
    wget http://lczero.org/get_network?sha=f49f934c6a5ef7df60aa687bdc879a5589757c810bbabe27a622a80e6c2bbfa9 -O weights_$pkgrel.txt
    echo '#!/bin/bash' > lczero
    echo "/usr/bin/lczero-bin -w /usr/share/lczero/weights_$pkgrel.txt" >> lczero
}

build() {
    cd ${srcdir}/${_pkgname}
    git submodule update --init --recursive
    mkdir -p build && cd build
    cmake .. || return 1
	make clean || return 1
	make || return 1
}

check() {
    cd $srcdir/$_pkgname/build
    ./tests
}

package() {
	cd "$srcdir/$_pkgname"
    install -Dm755 build/lczero $pkgdir/usr/bin/lczero-bin
    install -Dm755 lczero $pkgdir/usr/bin/lczero
    install -Dm644 weights_$pkgrel.txt $pkgdir/usr/share/lczero/weights_$pkgrel.txt
}
