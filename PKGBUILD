# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Loic Guegan <loic.guegan@mailbox.org>
pkgname=ochess
pkgver=v0.0.1
pkgrel=1
epoch=
pkgdesc="Chess game analysis software written in c++"
arch=("any")
url="https://gitlab.com/manzerbredes/ochess"
license=('GPLv3')
groups=()
depends=(wxwidgets-gtk3)
makedepends=(cmake wxwidgets-common)
source=("http://loicguegan.com/files_/ochess-v0.0.1.tar.gz")
sha256sums=(91948602423da0042f26777a8573f16fa02124843b2fcb10e238c70ef6d32288) #generate with 'makepkg -g'

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
    mkdir -p build
    cd build
    cmake ../
    make -j4
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    cd build
    # Create wrapper script (simpler shared library management)
    echo '#!/usr/bin/env bash' > ochess_wrapper.sh
    echo 'LD_LIBRARY_PATH=/usr/local/lib /usr/local/bin/ochess_executable' >> ochess_wrapper.sh

    install -Dm775 ochess_wrapper.sh "${pkgdir}/usr/local/bin/ochess"
    install -Dm775 ochess "${pkgdir}/usr/local/bin/ochess_executable"
    install -Dm775 libs/cgeditor/libcgeditor.so "${pkgdir}/usr/local/lib/ochess/libcgeditor.so"
    install -Dm775 libs/chessarbiter/libchessarbiter.so "${pkgdir}/usr/local/lib/ochess/libchessarbiter.so"
    install -Dm775 libs/pgnp/libpgnp.so "${pkgdir}/usr/local/lib/ochess/libpgnp.so"
    install -Dm775 libs/uciadapter/libuciadapter.so "${pkgdir}/usr/local/lib/ochess/libuciadapter.so"
    install -Dm775 libs/cgeditor/libs/chess-move-interface/libChessMoveInterface.so "${pkgdir}/usr/local/lib/ochess/libChessMoveInterface.so"
}
