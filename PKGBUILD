# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gcap2022
pkgver=2022.1.3
pkgrel=2
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for calculation of capital gains (2022 version)'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/gcap'
license=('LicenseRef-Custom')
depends=('sh' 'java-runtime=11' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/gcap/GCAP${pkgver%%.*}v${pkgver#*.}-v2.zip"
        'gcap.desktop'
        'gcap.sh'
        'LICENSE')
sha256sums=('4f03d397e05b53f364b36084e2174584470263261c61f8acb97a1b74704ba5f2'
            '3002cd342c2673eae262c05c0b04f2d8acecd96123d731df1b83f75be1c6b24a'
            'fbe0d3aa1e0260200f0465a0f12434c6fdf5e7dc28d65e47adf1dc21dbd7b539'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "GCAP${pkgver%%.*}" "GCAP${pkgver%%.*}/RFB_GCAP.ico"
}

package() {
    install -D -m755 gcap.sh "${pkgdir}/usr/bin/gcap-${pkgver%%.*}"
    install -D -m644 gcap.desktop "${pkgdir}/usr/share/applications/gcap-${pkgver%%.*}.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "GCAP${pkgver%%.*}/GCAP.jar" "${pkgdir}/usr/share/java/gcap-${pkgver%%.*}/gcap.jar"
    install -D -m644 "GCAP${pkgver%%.*}/pgd-updater.jar" -t "${pkgdir}/usr/share/java/gcap-${pkgver%%.*}"
    install -D -m644 "GCAP${pkgver%%.*}/Leia_me.htm" -t "${pkgdir}/usr/share/doc/gcap-${pkgver%%.*}"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/gcap-${pkgver%%.*}"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/lib" "${pkgdir}/usr/share/java/gcap-${pkgver%%.*}"
    ln -s "../../doc/gcap-${pkgver%%.*}/help" "${pkgdir}/usr/share/java/gcap-${pkgver%%.*}/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/gcap-${pkgver%%.*}.png"
    done < <(find "GCAP${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_GCAP_*_*x*x*.png' -print0)
}
