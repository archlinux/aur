# Maintainer: Ismet Togay <ismet.togay at gmail dot com>
# Contributor: Osman Karagöz <osmank3[at]gmail[dot]com>
# Contributor: Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=akia
pkgver=6.8.10
pkgrel=2
pkgdesc="TÜBİTAK AKİS smart card application"
arch=('x86_64')
url='https://akiskart.bilgem.tubitak.gov.tr/destek/'
license=('LicenseRef-proprietary')
depends=(
    'java-runtime>=11'
    'pcsclite'
    'ccid'
    'hicolor-icon-theme'
)
optdepends=(
    'pcsc-tools: smart card reader debugging utilities'
)
makedepends=(
    'icoutils'
)
provides=("akia-bin=${pkgver}")
conflicts=('akia-bin')
replaces=('akia-bin')
install='akia.install'

# Deb zip URL embeds upload year/month; bump those with pkgver, then updpkgsums.
_debver="${pkgver//./_}"
_debyear=2026
_debmonth=06

source=(
    "${pkgname}-${pkgver}.deb.zip::${url%/destek/}/wp-content/uploads/sites/33/${_debyear}/${_debmonth}/Akia_linux_${_debver}.deb_.zip"
    'akia.sh'
    'akia.desktop'
    'LICENSE'
)
b2sums=('0d9253f138541a551d5c52c173770b53d6aa72d210bc35fe5fed9de1fe22d4c1f202109b96a1b584ced47bf4ccd3ecc3f6ce554f306650f01f577245fe29cc58'
            'bbce8a6c1f30cd4cdf9ebb6261a7c3d31eca35ce143285aa8d77f3d7c6a2651000c30c06e29438f2b15b23a732a711f6f3d07b41a1de6f76a9f0366311e35705'
            'b0bfeebf718462aba0e105ade22a0b03385758e2d21229ae07bc5b038d8a0a9b061b8cb092770bcc8514b935fa0223360819cb640ead84ba6f33dcad58fa287e'
            'e803d8f083834c7c09a6845592f20be09301ca5b82e5493f02435276b7ff43335296db07f7f7a76cbd09924a0079b2952d28060589f735a01368ea41112ef867')

prepare() {
    cd "${srcdir}"

    bsdtar -xf "Akia_linux_${_debver}.deb"
    bsdtar -xf data.tar.* \
        "opt/Akia/akia-${pkgver}.jar" \
        opt/Akia/libakisp11.so \
        opt/Akia/Akia.png \
        "opt/Akia/docs/Akia Uygulaması Kullanım Kılavuzu.pdf" \
        opt/Akia/docs/AkilliKartTeknolojisi.pdf

    icotool -x -i 2 -o akia.png opt/Akia/Akia.png
}

package() {
    cd "${srcdir}"

    install -Dm644 "opt/Akia/akia-${pkgver}.jar" \
        "${pkgdir}/usr/share/java/akia/akia.jar"

    install -Dm755 opt/Akia/libakisp11.so \
        "${pkgdir}/usr/lib/akia/libakisp11.so"

    # MRegistry hardcodes /usr/lib/libakisp11.so; pacman-owned symlink (upstream cp).
    install -dm755 "${pkgdir}/usr/lib"
    ln -s akia/libakisp11.so "${pkgdir}/usr/lib/libakisp11.so"

    install -Dm755 "${srcdir}/akia.sh" "${pkgdir}/usr/bin/akia"

    install -Dm644 "${srcdir}/akia.desktop" \
        "${pkgdir}/usr/share/applications/akia.desktop"

    install -Dm644 akia.png \
        "${pkgdir}/usr/share/icons/hicolor/48x48/apps/akia.png"

    install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
    install -m644 "opt/Akia/docs/Akia Uygulaması Kullanım Kılavuzu.pdf" \
        "${pkgdir}/usr/share/doc/${pkgname}/akia-user-guide.pdf"
    install -m644 "opt/Akia/docs/AkilliKartTeknolojisi.pdf" \
        "${pkgdir}/usr/share/doc/${pkgname}/smartcard-technology.pdf"

    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
