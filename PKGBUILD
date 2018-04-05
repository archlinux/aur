# Maintainer: Lev Levitsky <levlev at mail.ru>
pkgname=crux-toolkit-git
pkgver=r3149.4438655b
pkgrel=1
pkgdesc="The Crux mass spectrometry analysis toolkit"
arch=('x86_64')
url="http://crux.ms/"
license=('Apache')
depends=('gcc-libs')
makedepends=('git' 'subversion' 'cmake' 'sed')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}-bin")
source=('git+https://github.com/crux-toolkit/crux-toolkit')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    # Git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cmake -DCMAKE_INSTALL_PREFIX:PATH="${pkgdir}/usr" -DCMAKE_VERBOSE_MAKEFILE=OFF .
    sed -i 's|^[[:space:]]*include(.*doc/user|#&|' cmake_install.cmake
    make
}

package() {
    cd "$srcdir/${pkgname%-git}"
    make install
    rm "${pkgdir}/usr/license.txt"
}
