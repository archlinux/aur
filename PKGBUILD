# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ismail-yilmaz
_pkgname=Bobcat
pkgname=${_pkgname,,}-terminal
pkgver=0.9.9
pkgrel=2
uppname=upp-posix
upprel=2026.1
uppver=18468
pkgdesc="A powerful yet user-friendy cross-platform terminal emulator"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('GPL-3.0')

conflicts=("${pkgname}"{-git,-bin})
provides=("${pkgname}")

makedepends=(
    'git'
    'pkg-config'
)
depends=(
    'gtk3' 'libnotify' 'openssl' 'freetype2' 'libx11' 'libxinerama'
    'libxrender' 'libxft' 'libxdmcp' 'fontconfig' 'libxcb' 'libxext'
    'gdk-pixbuf2' 'zlib' 'harfbuzz' 'pango' 'atk' 'cairo' 'glib2'
    'libpng' 'gcc-libs' 'expat'
)

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${_pkgauthor}/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz"
        "${uppname}-${uppver}.tar.xz::https://github.com/ultimatepp/ultimatepp/releases/download/v$upprel/${uppname}-${uppver}.tar.xz")
sha256sums=('71dfb9ed77ed89440205935f4c04e0eff194a471552173b98b5ccf4d0055ec1f'
            '701dbb10edf03c77ceff66c89a2ffa23fce2b788cc480b0cae39d0689519b633')

prepare() {
    cd "${srcdir}" || exit 1

    tar xf ${uppname}-${uppver}.tar.xz
}

build() {
    cd "${srcdir}" || exit 1

    cd ./upp || exit 1

    ./configure

    make -f ./umkMakefile -j$(nproc)

    cd .. || exit 1

    mkdir -p build

    upp/umk upp/uppsrc,${_pkgname}-${pkgver} ${_pkgname} GCC -brh +GUI,SHARED ./build/bobcat
}

package() {
    # Install desktop file and icon
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/data/bobcat.desktop" "${pkgdir}/usr/share/applications/bobcat.desktop"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}/data/bobcat128x128.png" "${pkgdir}/usr/share/pixmaps/bobcat.png"

    # Install readme
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Install license
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install executable
    install -Dm755 "${srcdir}/build/bobcat" "${pkgdir}/usr/bin/bobcat"
}
