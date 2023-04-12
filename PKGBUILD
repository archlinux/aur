# Maintainer: Winston Astrachan <winston dot astrachan at gmail dot com>
# Contributor: Johann Gründl <mail at johanngruendl dot at>

pkgname=ttf-adobe-source-fonts
pkgver=20230401200  # because there are three different versions installed by this package, pkgver does not adhere to the upstream version
_pkgver_source_code_pro="2.042R-u/1.062R-i/1.026R-vf"
_pkgver_source_serif="4.005R"
_pkgver_source_sans="3.052R"
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
sha256sums=('19d2c07eff0d91927c47a482c38e591ba855664fc65440006fb65d0157841249'
            '92415a067bfa449876cd3f4a4229d18a9140588574299696da81be0e213d69df'
            '21f4e24bbd7b24c31ba13ddb10600db3a61565f20f2ccf2347f4e114e6e34596')

prepare() {
    # Source Serif has a VAR folder
    for pattern in "*TTF/*.ttf" "*VAR/*.ttf" "*LICENSE.md"; do
        tar -xf "${pkgname}-${pkgver}-source-serif.tar.gz" --wildcards $pattern
    done

    # Source Sans and Source Code Pro have a VF folder instead
    for archive in "${pkgname}-${pkgver}-source-code-pro.tar.gz" "${pkgname}-${pkgver}-source-sans.tar.gz"; do
        for pattern in "*TTF/*.ttf" "*VF/*.ttf" "*LICENSE.md"; do
            tar -xf $archive --wildcards $pattern
        done
    done
}

package() {
    cd $srcdir
    for path in *; do
        if [ -d $path ]; then
            install -Dm644 $path/TTF/*.ttf -t "${pkgdir}/usr/share/fonts/${pkgname}"

            # Source Serif has a VAR folder
            if [ -d "${path}/VAR/" ]; then
                install -Dm644 $path/VAR/*.ttf -t "${pkgdir}/usr/share/fonts/${pkgname}"
            fi

            # Source Sans and Source Code Pro have a VF folder instead
            if [ -d "${path}/VF/" ]; then
            install -Dm644 $path/VF/*.ttf -t "${pkgdir}/usr/share/fonts/${pkgname}"
            fi
        fi
    done

    # the license for all fonts in the "source" family is shared
    license_files=(*/LICENSE.md)
    install -Dm644 "${license_files[0]}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
