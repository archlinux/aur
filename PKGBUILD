# Maintainer: BrLi <brli@chakralinux.org>

pkgbase=ttf-twcns-fonts
pkgname=("${pkgbase}" "${pkgbase}"-doc)
pkgdesc='Chinese TrueType fonts by Ministry of Education of Taiwan government, support CNS11643 standard, including Kai and Sung fontface.'
pkgver=20191129
pkgrel=1
arch=('any')
url='https://data.gov.tw/node/5961'
license=('custom')
makedepends=(dos2unix convmv)
source=('https://www.cns11643.gov.tw/AIDB/Open_Data.zip'
        '53-twcns.conf' # grab from older version of rpm
        'LICENSE-zh_TW'
        'LICENSE')
sha1sums=('c3bebe1c044861111a13a2b500bd4f92f82239c0'
          'e9a1bf83c957966941a1a3bb7e406169d47facde'
          '08c5ee06a2248340613d9bd7314a824883851bd1'
          '6be77081aa46e90e417ec73027e0477c3297a1c9')

prepare() {
    cd "${srcdir}"/Open_Data/
    msg 'Converting every text file into UTF-8/Unix EOL'
    convmv -f big5 -t utf8 -r --notest --nfc .
    dos2unix -k */*.txt
    dos2unix -k */*/*.txt
}

package_ttf-twcns-fonts() {
    depends=(freetype2 fontconfig)
    cd "${srcdir}"/Open_Data/
    msg 'Installing the fonts'
    install -dm755 "${pkgdir}"/usr/share/fonts/TTF
    mv -v Fonts/TW-Kai* "${pkgdir}"/usr/share/fonts/TTF/
    mv -v Fonts/TW-Sung* "${pkgdir}"/usr/share/fonts/TTF/
    msg 'Installing configuration'
    install -dm755 "${pkgdir}"/etc/fonts/conf.{avail,d}
    install -Dm644 "${srcdir}"/53-twcns.conf "${pkgdir}"/etc/fonts/conf.avail/53-twcns.conf
    ln -sf "${pkgdir}"/etc/fonts/conf.{avail,d}/53-twcns.conf
    msg 'Installing the license'
    install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    install -Dm644 ${srcdir}/LICENSE-zh_TW ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-zh_TW
}

package_ttf-twcns-fonts-doc() {
    options=('docs')
    cd "${srcdir}"/Open_Data/
    msg 'Installing the documents'
    install -dm755 "${pkgdir}"/usr/share/doc/"${pkgbase}"/
    for dir in Fonts MapingTables Properties; do
        cp -rv $dir "${pkgdir}"/usr/share/doc/"${pkgbase}"/
    done
    install -dm755 "${pkgdir}"/usr/share/licenses/
    ln -sf /usr/share/licenses/"${pkgbase}" "${pkgdir}"/usr/share/licenses/"${pkgname}"
}
