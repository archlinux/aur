# Maintainer: BrLi <brli@chakralinux.org>
# shellcheck disable=SC2034,SC2155,SC2148

pkgbase=ttf-twcns-fonts
pkgname=("${pkgbase}"{,-doc})
pkgdesc='Chinese TrueType fonts by Ministry of Education of Taiwan government, support CNS11643 standard, including Kai and Sung fontface.'
pkgver=20231106
pkgrel=1
arch=('any')
url='https://data.gov.tw/dataset/5961'
license=('custom' 'OFL')
makedepends=(dos2unix convmv wget)
source=('https://www.cns11643.gov.tw/AIDB/Open_Data.zip'
        '46-twcns.conf' '66-twcns.conf'
        '政府資料開放授權條款-第一版' 'OGDL-1.0' 'COPYRIGHT')
sha256sums=('8d6f01efce8b9fb23d4cdcb140e20d670aa3ef006195b9b71b49f8cd117d9132'
            '70345fd5ef20a8c290805a89e40a7b74f42b725f07590337ac171511a1014bbf'
            'fc7ca074ccbd4ab8fa01b99cf03182247b3ae25586300a7ecc015a790eafedbe'
            '5752216377a7b59433b2cc83164be2f93533446e72953a1d4769ceddd1349a00'
            '114afb4ba741595b69fbabb5e1d6668f095bbe4acfee5e5358d83cfbc72f1351'
            'f14b044a0bccf49b63b5fb7e6261537d484f0aab69b93e6a082b9baa69be7346')
#DLAGENTS=('https::/usr/bin/curl -gqb "" -fLC - --retry 999 -o %o %u') # not tested yet
#DLAGENTS=('https::/usr/bin/wget --progress=bar -c -O %o %u')

prepare() {
    cd "${srcdir}"/Open_Data/ || exit
    msg 'Converting every text file into UTF-8/Unix EOL'
    convmv -f big5 -t utf8 -r --notest --nfc .
    dos2unix -k ./*/*.txt
    dos2unix -k ./*/*/*.txt
}

package_ttf-twcns-fonts() {
    cd "${srcdir}"/Open_Data/ || exit
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
    install -Dm644 "${srcdir}"/政府資料開放授權條款-第一版 "${pkgdir}/usr/share/licenses/${pkgname}/政府資料開放授權條款-第一版"
    install -Dm644 "${srcdir}"/OGDL-1.0 "${pkgdir}/usr/share/licenses/${pkgname}/OGDL-1.0"
    install -Dm644 "${srcdir}"/COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
    # TODO: proper OFL-1.1 license
}

package_ttf-twcns-fonts-doc() {
    pkgdesc='Misc files including mapping table, property metadata and voice for ttf-twcns-fonts'
    options=('docs')
    cd "${srcdir}"/Open_Data/ || exit
    msg 'Installing the documents'
    install -dm755 "${pkgdir}/usr/share/doc/${pkgbase}"/
    for dir in Fonts MapingTables Properties Voice; do
        cp -rv $dir "${pkgdir}/usr/share/doc/${pkgbase}"/
    done
    install -dm755 "${pkgdir}"/usr/share/licenses/
    ln -sf /usr/share/licenses/"${pkgbase}" "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 '資料更新說明.txt' "${pkgdir}/usr/share/doc/${pkgbase}/changelog"
}
