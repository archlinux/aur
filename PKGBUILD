# Maintainer: Thibault 'Ryp' Schueller  <ryp.sqrt@gmail.com>

_gitname=psp2sdk
pkgname=psp2sdk-git
pkgver=r325.d483130
pkgrel=1
pkgdesc="Open source SDK for the PSP2"
arch=('any')
url="http://github.com/psp2dev/psp2sdk"
license=('MPL')
makedepends=('git' 'cmake' 'arm-none-eabi-gcc' 'openssl')
conflicts=('psp2sdk')
provides=('psp2sdk')
options=(!buildflags !strip !libtool)
install='psp2sdk.install'
source=('git+https://github.com/psp2dev/psp2sdk.git#branch=cmake'
    psp2sdk.install)
sha512sums=('SKIP'
    'a32062fe71d5aedd825d6bd87e621c59819d05edb97f648dc53dd99aff7cb13b00db931e79b7dc09d79bc8132d30e5e3f259504b1f1ba532059439341c04639a')

pkgver() {
    cd "$srcdir/$_gitname"
#     git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname/tools"
    mkdir -p build && pushd build
    cmake "$srcdir/$_gitname/tools"                                         \
        -DCMAKE_INSTALL_PREFIX=/opt/psp2sdk                                 \
        -DCMAKE_BUILD_TYPE=Release
    make

    cd "$srcdir/$_gitname/src"
    mkdir -p build && pushd build
    cmake "$srcdir/$_gitname/src"                                           \
        -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain-arm-none-eabi-psp2.cmake  \
        -DCMAKE_INSTALL_PREFIX=/opt/psp2sdk                                 \
        -DCMAKE_BUILD_TYPE=Release
    make
}

package() {
    cd "$srcdir/$_gitname/tools/build"
    make install DESTDIR="$pkgdir"
    cd "$srcdir/$_gitname/src/build"
    make install DESTDIR="$pkgdir"
}
