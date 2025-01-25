# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-epub-mupdf
_pkgname=zathura-pdf-mupdf
pkgver=0.4.4
_pkgver=0.4.5-rc1
pkgrel=11
pkgdesc="EPUB support for Zathura (MuPDF backend) (Supports ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg-turbo' 'libmupdf' 'openjpeg2' 'openssl' 'zathura')
makedepends=('meson' 'ninja' 'git' 'appstream-glib')
source=("${_pkgname}-${_pkgver}.tar.gz::https://github.com/Freed-Wu/${_pkgname}/archive/refs/tags/${_pkgver}.tar.gz"
        0001-Remove-mupdf-linking-detection.patch)
sha512sums=('a0c5efc77ec9c14a6b50c6c79c6b658687078ba15864f0dd63f4258571e24e0b2178d2997c4167af8cb4fc5546ac44b3ccb7476b7dd76c5c2ee82d6aca97094b'
            '53f76de2e857a8f57ed9da00e7d0d4c647c38c1a3cb318b27427a1201d7290654aaa3271088e6839f989c7b0ac2a29d353b8bc01561c82e38f33bdb8aba6208c')

prepare() {
        cd "${_pkgname}-${_pkgver}"
        patch -p1 < "${srcdir}/0001-Remove-mupdf-linking-detection.patch"
}

build() {
        cd "${_pkgname}-${_pkgver}"
        arch-meson -Dpdf=false build
        ninja -C build
}

package() {
        cd "${_pkgname}-${_pkgver}"
        DESTDIR="${pkgdir}" ninja -C build install
        install -Dm 664 LICENSE "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
