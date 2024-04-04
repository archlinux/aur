# Maintainer: Johannes Löthberg <johannes@kyriasis.com>
# Maintainer: Robin Candau <antiz@archlinux.org>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Moritz Lipp <mlq@pwmt.org>

pkgname=zathura-pdf-mupdf
pkgver=0.4.1
pkgrel=19
pkgdesc="PDF support for Zathura (MuPDF backend) (Supports PDF, ePub, and OpenXPS)"
url="https://pwmt.org/projects/zathura-pdf-mupdf/"
arch=('x86_64')
license=('Zlib')
conflicts=('zathura-pdf-poppler')
depends=('cairo' 'gumbo-parser' 'jbig2dec' 'libjpeg' 'libmupdf' 'openjpeg2' 'openssl' 'zathura')
makedepends=('meson' 'ninja' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://git.pwmt.org/pwmt/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        0001-Remove-mupdf-linking-detection.patch)
sha256sums=('3cf142bfd189ee2cd0130d18a6c202bbc188f172695642a46556e824bd78b9aa'
            'b72a21f697ffb6183345db62c3e7f97974ac7747a34587e0c84a4e5b87848af0')

prepare() {
        cd "${pkgname}-${pkgver}"
        patch -p1 < "${srcdir}/0001-Remove-mupdf-linking-detection.patch"
}

build() {
        cd "${pkgname}-${pkgver}"
        arch-meson build
        ninja -C build
}

package() {
        cd "${pkgname}-${pkgver}"
        DESTDIR="${pkgdir}" ninja -C build install
        install -Dm 664 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
