# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: afterSt0rm <ateles.1@gmail.com>
# Contributor: Márcio Sousa Rocha <marciosr10@gmail.com>

pkgname=irpf
pkgver=2024.1.0
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) program'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/assuntos/meu-imposto-de-renda'
license=('LicenseRef-custom')
depends=('sh' 'java-runtime=11' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/irpf/arquivos/IRPF${pkgver%%.*}-${pkgver#*.}.zip"
        'irpf.desktop'
        'irpf.sh'
        'LICENSE')
sha256sums=('ef6ef96a297783f37cd975cb87c3416c72e69a3410f125b1b944075f17667532'
            '129071a957742e0a3703e3952745b5491698d9cd855daa6c3e174658989e6e90'
            '38a727fe91acce9192fad3cc0235e6110e14279f32ee8efbc45a008cc03eb81f'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    wrestool -x -t 14 -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"
    icotool -x -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"_*_*_*.ico
}

package() {
    install -D -m755 irpf.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 irpf.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "IRPF${pkgver%%.*}"/{irpf,pgd-updater}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
    install -D -m644 "IRPF${pkgver%%.*}/Leia-me.htm" -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/"lib{,-modulos} "${pkgdir}/usr/share/java/${pkgname}"
    ln -s "../../doc/${pkgname}/help" "${pkgdir}/usr/share/java/${pkgname}/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find "IRPF${pkgver%%.*}" -maxdepth 1 -type f -name "IRPF${pkgver%%.*}.exe"_*_*_*_*_*x*x*.png -print0)
}
