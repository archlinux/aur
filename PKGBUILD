# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gcap2024
pkgver=2024.1.5
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for calculation of capital gains (version 2024)'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/gcap'
license=('LicenseRef-Custom')
depends=('sh' 'java-runtime' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/gcap/GCAP${pkgver%%.*}v${pkgver#*.}.zip"
        'gcap.desktop'
        'gcap.sh'
        'LICENSE')
sha256sums=('e0bc3ddf4cf2e80134de86f3093abc5e0a488a3e179cb58873ab45550e17fb35'
            'f3291fbf520575410198b3ca04d8ccdacce33a421eda5ed805816752d9b9ec01'
            'ca4f5c4f7973f0c84ab4e494dd11752d7e3e663c6819991df28668a6c5d823b3'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "GCAP${pkgver%%.*}" "GCAP${pkgver%%.*}/RFB_GCAP.ico"
}

package() {
    install -D -m755 gcap.sh "${pkgdir}/usr/bin/gcap2024"
    install -D -m644 gcap.desktop "${pkgdir}/usr/share/applications/gcap2024.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "GCAP${pkgver%%.*}/GCAP.jar" "${pkgdir}/usr/share/java/${pkgname}/gcap.jar"
    install -D -m644 "GCAP${pkgver%%.*}/pgd-updater.jar" -t "${pkgdir}/usr/share/java/${pkgname}"
    install -D -m644 "GCAP${pkgver%%.*}/Leia_me.htm" -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/lib" "${pkgdir}/usr/share/java/${pkgname}"
    ln -s "../../doc/${pkgname}/help" "${pkgdir}/usr/share/java/${pkgname}/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find "GCAP${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_GCAP_*_*x*x*.png' -print0)
}
