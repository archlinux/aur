# Maintainer: BrLi <brli@chakralinux.org>

pkgbase=ttf-twcns-fonts
pkgname=(${pkgbase}{,-doc})
pkgdesc='Chinese TrueType fonts by Ministry of Education of Taiwan government, support CNS11643 standard, including Kai and Sung fontface.'
pkgver=20220803
pkgrel=1
arch=('any')
url='https://data.gov.tw/node/5961'
license=('custom')
makedepends=(dos2unix convmv wget)
source=('https://www.cns11643.gov.tw/AIDB/Open_Data.zip'
        '46-twcns.conf' '66-twcns.conf'
        'LICENSE-zh_TW' 'LICENSE')
sha256sums=('2eed1993606c8be42320f1a9a0eb3b6b4a8be7c22377832d88109b401ebf5658'
            '70345fd5ef20a8c290805a89e40a7b74f42b725f07590337ac171511a1014bbf'
            'fc7ca074ccbd4ab8fa01b99cf03182247b3ae25586300a7ecc015a790eafedbe'
            '5752216377a7b59433b2cc83164be2f93533446e72953a1d4769ceddd1349a00'
            '114afb4ba741595b69fbabb5e1d6668f095bbe4acfee5e5358d83cfbc72f1351')
#DLAGENTS=('https::/usr/bin/curl -gqb "" -fLC - --retry 999 -o %o %u') # not tested yet
DLAGENTS=('https::/usr/bin/wget --progress=bar -c -O %o %u')

prepare() {
    cd "${srcdir}"/Open_Data/
    msg 'Converting every text file into UTF-8/Unix EOL'
    convmv -f big5 -t utf8 -r --notest --nfc .
    dos2unix -k */*.txt
    dos2unix -k */*/*.txt
}

package_ttf-twcns-fonts() {
    cd "${srcdir}"/Open_Data/
    msg 'Installing the fonts'
    install -dm755 "${pkgdir}"/usr/share/fonts/TTF
    mv -v Fonts/TW-Kai* "${pkgdir}"/usr/share/fonts/TTF/
    mv -v Fonts/TW-Sung* "${pkgdir}"/usr/share/fonts/TTF/
    msg 'Installing configuration'
    install -dm755 "${pkgdir}"/usr/share/fontconfig/conf.default
    install -Dm644 "${srcdir}"/46-twcns.conf "${pkgdir}"/usr/share/fontconfig/conf.avail/46-twcns.conf
    install -Dm644 "${srcdir}"/66-twcns.conf "${pkgdir}"/usr/share/fontconfig/conf.avail/66-twcns.conf
    ln -sf ../conf.avail/46-twcns.conf "${pkgdir}"/usr/share/fontconfig/conf.default/46-twcns.conf
    ln -sf ../conf.avail/66-twcns.conf "${pkgdir}"/usr/share/fontconfig/conf.default/66-twcns.conf
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
    install -Dm644 '資料更新說明.txt' "${pkgdir}"/usr/share/doc/"${pkgbase}"/changelog
}
