# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gcap2023
pkgver=2023.1.3
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for calculation of capital gains'
arch=('any')
url='https://www.gov.br/pt-br/servicos/apurar-imposto-sobre-ganhos-de-capital'
license=('LicenseRef-custom')
depends=('sh' 'java-runtime=11' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/gcap/GCAP${pkgver%%.*}v${pkgver#*.}.zip"
        'gcap.desktop'
        'gcap.sh'
        'LICENSE')
sha256sums=('cc611909db782a17958150f945d5793d33341f911fb2d727d9bef35f4780d9d3'
            'bdc291f3eee9a505b09dce9fefc057f23cc6eeed7079f723795f1f0cccebef6e'
            '58b90f78d63b7c01ce5ecab4040f5d032a6088aef7e11a4ccd078010474cedf6'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "GCAP${pkgver%%.*}" "GCAP${pkgver%%.*}/RFB_GCAP.ico"
}

package() {
    install -D -m755 gcap.sh "${pkgdir}/usr/bin/gcap2023"
    install -D -m644 gcap.desktop "${pkgdir}/usr/share/applications/gcap2023.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "GCAP${pkgver%%.*}/GCAP.jar" "${pkgdir}/usr/share/java/${pkgname}/gcap.jar"
    install -D -m644 "GCAP${pkgver%%.*}/pgd-updater.jar" -t "${pkgdir}/usr/share/java/${pkgname}"
    install -D -m644 "GCAP${pkgver%%.*}/Leia_me.htm" -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/lib" "${pkgdir}/usr/share/java/${pkgname}"
    ln -s ../../doc/gcap/help "${pkgdir}/usr/share/java/${pkgname}/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find "GCAP${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_GCAP_*_*x*x*.png' -print0)
}
