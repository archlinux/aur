# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gcap2022
pkgver=2022.1.4
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for calculation of capital gains (2022 version)'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/gcap'
license=('LicenseRef-Custom')
depends=(
    'hicolor-icon-theme'
    'java-runtime=11'
    'sh')
optdepends=(
    'cups: for print support')
makedepends=(
    'icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/gcap/GCAP${pkgver%%.*}v${pkgver#*.}.zip"
        'gcap.desktop'
        'gcap.sh'
        'LICENSE')
sha256sums=('68a5f7e0866f9e80e518da11adc7e633eeef9611815646ec19c69d05ce084406'
            '8380ddac0f46e09b692cf6de3d10c7d2a58047e18075bb3502f9ccd9746742d9'
            '6d8405ce58467b0f385fa16e916a85700188e7dc5a919c54f412023de942dbdd'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "GCAP${pkgver%%.*}" "GCAP${pkgver%%.*}/RFB_GCAP.ico"
}

package() {
    install -D -m755 gcap.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 gcap.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "GCAP${pkgver%%.*}/GCAP.jar" "${pkgdir}/usr/share/java/${pkgname}/gcap.jar"
    install -D -m644 "GCAP${pkgver%%.*}/pgd-updater.jar" -t "${pkgdir}/usr/share/java/${pkgname}"
    install -D -m644 "GCAP${pkgver%%.*}/Leia_me.htm" -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/lib" "${pkgdir}/usr/share/java/${pkgname}"
    ln -sr "${pkgdir}/usr/share/doc/${pkgname}/help" "${pkgdir}/usr/share/java/${pkgname}/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find "GCAP${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_GCAP_*_*x*x*.png' -print0)
}
