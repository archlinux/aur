# Maintainer: BrLi <brli@chakralinux.org>

pkgbase=ttf-twcns-fonts
pkgname=(${pkgbase}{,-doc})
pkgdesc='Chinese TrueType fonts by Ministry of Education of Taiwan government, support CNS11643 standard, including Kai and Sung fontface.'
pkgver=20210622
pkgrel=1
arch=('any')
url='https://data.gov.tw/node/5961'
license=('custom')
makedepends=(dos2unix convmv wget)
source=('https://www.cns11643.gov.tw/AIDB/Open_Data.zip'
        '53-twcns.conf' # grab from older version of rpm
        'LICENSE-zh_TW'
        'LICENSE')
sha256sums=('7c20fe628a1efd75fe0b2a91717e4a2e5c52cf42b5c6d3495dff8d4416b34c23'
            'd24c12eab3666a0dc8b64327ae9d79512cd0cf4c8b71284e9dfec6f6273d8abc'
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
    install -dm755 "${pkgdir}"/etc/fonts/conf.d
    install -Dm644 "${srcdir}"/53-twcns.conf "${pkgdir}"/etc/fonts/conf.avail/53-twcns.conf
    ln -sf ../conf.avail/53-twcns.conf "${pkgdir}"/etc/fonts/conf.d/53-twcns.conf
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
