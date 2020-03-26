# Maintainer: LIN Rs <LinRs[d]users.noreply.github.com>

pkgname=devilutionx-git
_pkgname=devilutionx
pkgver=1.0.1.r17.g201c6fe8
pkgrel=1
pkgdesc="Diablo devolved for linux (git version)"
arch=('x86_64')
url="https://github.com/diasurgical/devilutionX"
license=('custom:unlicense')
depends=('sdl2_mixer' 'sdl2_ttf' 'libsodium')
makedepends=('git' 'cmake')
optdepends=('ttf-charis-sil: CharisSILB.ttf')
provides=("${_pkgname}"="${pkgver}")
install="${_pkgname}".install
source=(
    "${_pkgname}::git+https://github.com/diasurgical/devilutionX.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${_pkgname}"
    ( set -o pipefail
      git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_pkgname}"
    mkdir -p build
    cd build
    cmake \
	-DCMAKE_BUILD_TYPE=Release ..
    make
}
package() {
    cd "${_pkgname}"
    install -Dm755 build/"${_pkgname}" \
	    -t "${pkgdir}"/usr/bin/
    install -Dm644 LICENSE \
	    -t "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -Dm644 Packaging/resources/16.png \
	    "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/devilutionx.png
    install -Dm644 Packaging/resources/Diablo_32.png \
	    "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/devilutionx.png
    install -Dm644 Packaging/resources/Diablo_48.png \
	    "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/devilutionx.png
    install -Dm644 Packaging/fedora/devilutionx.desktop \
	    -t "${pkgdir}"/usr/share/applications/
}
