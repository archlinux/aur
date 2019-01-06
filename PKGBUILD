# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
# Maintainer: Robin Appelman <robin@icewind.nl>

_pkgbase=OpenBoardView
_pkgname=OpenBoardView-inflex
_glad_version='0.1.28'
pkgname=${_pkgname,,}
pkgver=2018062301
pkgrel=1
pkgdesc='Linux SDL/ImGui edition software for viewing .brd files'
arch=('i686' 'x86_64')
url='https://openboardview.org/'
license=('MIT')
depends=('sdl2' 'sqlite' 'zlib' 'fontconfig' 'gtk3' 'libpng')
makedepends=('git' 'cmake' 'python')
conflicts=('openboardview')
source=("git+https://github.com/inflex/OpenBoardView.git#tag=R${pkgver}" "https://github.com/Dav1dde/glad/archive/v${_glad_version}.zip")
sha512sums=('SKIP'
            '46fade309d4c2803cb9d0e15e4c2416fc31973649f2d5860b6f57f36b4495c33d386e0fc2244d9ea0bee8070ca9b3874cd23ac50d9f95370c6bdede870baaece')

prepare() {
    cd "${srcdir}"
    rm -r "${_pkgbase}/src/glad"
    mv "glad-${_glad_version}" "${_pkgbase}/src/glad"
}

build() {
    mkdir -p "${srcdir}/${_pkgbase}/build"
    cd "${srcdir}/${_pkgbase}/build"
    cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${srcdir}/${_pkgbase}"
    install -Dm755 build/src/openboardview/openboardview "${pkgdir}/usr/bin/openboardview"
    install -Dm755 utilities/bvconv.sh "${pkgdir}/usr/bin/bvconv"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
