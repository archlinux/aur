# Maintainer : Daniel Bermond <dbermond@archlinux.org>

pkgname=irpf2023
pkgver=2023.1.5
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) program (2023 version)'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/assuntos/meu-imposto-de-renda'
license=('LicenseRef-custom')
depends=('sh' 'java-runtime=11' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/irpf/arquivos/IRPF${pkgver%%.*}-${pkgver#*.}.zip"
        'irpf.desktop'
        'irpf.sh'
        'LICENSE')
sha256sums=('88956b8ff78c20e1d9d9ef9aa4f9d1fc7d12422610f739f90419b61fc0db6da4'
            '463fc0234a23d7125783e24e995785b6d2430d709a87b96db76c655226ea401c'
            '959f49db6ab954d74e25d2537b009750e44a5fdd6f70cf40fed2b3123c8d2771'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    wrestool -x -t 14 -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"
    icotool -x -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"_*_*_*.ico
}

package() {
    install -D -m755 irpf.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 irpf.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
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
