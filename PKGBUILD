# Maintainer: LIN Rs <LinRs[d]users.noreply.github.com>

pkgname=devilutionx-git
pkgver=1.2.1.r711.g7fbcfeb3
pkgrel=1
pkgdesc="Diablo devolved for linux (git version)"
arch=('x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('sdl2_ttf' 'libsodium')
makedepends=('git' 'cmake')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}"="${pkgver}")
source=(
    "${pkgname%-git}::git+https://github.com/diasurgical/devilutionX.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${pkgname%-git}"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${pkgname%-git}"
    mkdir -p build
    cd build
    cmake \
	-DCMAKE_INSTALL_PREFIX="/usr" \
	-DBINARY_RELEASE=ON \
	-DCMAKE_BUILD_TYPE=Release ..
    make
}
package() {
    cd "${pkgname%-git}"
    install -Dm644 LICENSE \
	    -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
    cd build
    make install DESTDIR="${pkgdir}"
}
