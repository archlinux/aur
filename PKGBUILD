# Maintainer: Adrian Kocis <adrian dot kocis at gmail>
# Contributor: Swift Geek
pkgname=pamix-git
_pkgname=PAmix
pkgver=1.6.r10.gea4ab3b.0.gea4ab3b
pkgrel=1
pkgdesc="PAMix - the pulseaudio terminal mixer"
arch=('x86_64')
url="https://github.com/patroclos/PAmix"
license=('MIT')
depends=('ncurses' 'pulseaudio')
makedepends=('git' 'cmake')
source=("git://github.com/patroclos/PAmix.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    (
        set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_pkgname}"
    cmake . -B build -DCMAKE_BUILD_TYPE=RELEASE -DWITH_UNICODE=1 -DNCURSESW_H_INCLUDE="ncurses.h" \
         -DCMAKE_INSTALL_PREFIX="/usr"
    cd build
    make
}

package() {
    cd "${srcdir}/${_pkgname}/build"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
