# Maintainer: BrLi <brli@chakralinux.org>

pkgbase=ttf-twcns-fonts
pkgname=(${pkgbase}{,-doc})
pkgdesc='Chinese TrueType fonts by Ministry of Education of Taiwan government, support CNS11643 standard, including Kai and Sung fontface.'
pkgver=20200305
pkgrel=1
arch=('any')
url='https://data.gov.tw/node/5961'
license=('custom')
makedepends=(dos2unix convmv)
source=('https://www.cns11643.gov.tw/AIDB/Open_Data.zip'
        '53-twcns.conf' # grab from older version of rpm
        'LICENSE-zh_TW'
        'LICENSE')
sha1sums=('f850ddf9169f0602cc229829273ba080f62bcd38'
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
    pkgdesc='Misc files including mapping table, property metadata and voice for ttf-twcns-fonts'
    options=('docs')
    cd "${srcdir}"/Open_Data/
    msg 'Installing the documents'
    install -dm755 "${pkgdir}"/usr/share/doc/"${pkgbase}"/
    for dir in Fonts MapingTables Properties Voice; do
        cp -rv $dir "${pkgdir}"/usr/share/doc/"${pkgbase}"/
    done
    install -dm755 "${pkgdir}"/usr/share/licenses/
    ln -sf /usr/share/licenses/"${pkgbase}" "${pkgdir}"/usr/share/licenses/"${pkgname}"
    install -Dm644 資料更新說明.txt "${pkgdir}"/usr/share/doc/"${pkgbase}"/changelog
}
