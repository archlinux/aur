# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Johann Gründl <mail at johanngruendl dot at>

pkgname=ttf-adobe-source-fonts
pkgver=20220300900  # because there are three different versions installed by this package, pkgver does not adhere to the upstream version
_pkgver_source_code_pro="2.038R-ro/1.058R-it/1.018R-VAR"
_pkgver_source_serif="4.004R"
_pkgver_source_sans="3.046R"
pkgrel=1
pkgdesc="TTF versions of Adobe's Source fonts (includes Source Sans, Source Serif, and Source Code Pro)."
arch=('any')
url="https://github.com/adobe-fonts"
license=('custom:SIL')
conflicts=('ttf-sourcesanspro')
source=("${pkgname}-${pkgver}-source-code-pro.tar.gz::https://github.com/adobe-fonts/source-code-pro/archive/refs/tags/${_pkgver_source_code_pro}.tar.gz"
        "${pkgname}-${pkgver}-source-serif.tar.gz::https://github.com/adobe-fonts/source-serif/archive/refs/tags/${_pkgver_source_serif}.tar.gz"
        "${pkgname}-${pkgver}-source-sans.tar.gz::https://github.com/adobe-fonts/source-sans/archive/refs/tags/${_pkgver_source_sans}.tar.gz")
noextract=("${source[@]%%::*}")
sha256sums=('d8f879fefd66ecb7291ea2d73984b9c0a97fb499424e58290ba6b81787d0c725'
            'dfb364735699cb830caad534cf7741234804d28e4b6fc5e4736b2401f6131aba'
            '7a0a3a0c9ff2740380eddc28a53b4b0dc99491da5f900f4add5af2d1a18e06bc')

prepare() {
    for archive in "${source[@]%%::*}"; do
        for pattern in "*TTF/*.ttf" "*VAR/*.ttf" "*LICENSE.md"; do
            tar -xf $archive --wildcards $pattern
        done
    done
}

package() {
    cd $srcdir
    for path in *; do
        if [ -d $path ]; then
            install -Dm644 $path/TTF/*.ttf -t "${pkgdir}/usr/share/fonts/${pkgname}"
            install -Dm644 $path/VAR/*.ttf -t "${pkgdir}/usr/share/fonts/${pkgname}"
        fi
    done

    # the license for all fonts in the "source" family is shared
    license_files=(*/LICENSE.md)
    install -Dm644 "${license_files[0]}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
