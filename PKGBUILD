# Maintainer : Daniel Bermond <dbermond@archlinux.org>
# Contributor: afterSt0rm <ateles.1@gmail.com>
# Contributor: Márcio Sousa Rocha <marciosr10@gmail.com>

pkgname=irpf
pkgver=2026.1.2
pkgrel=2
pkgdesc='Brazilian physical person income tax (IRPF) program'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/dirpf'
license=('LicenseRef-Custom')
depends=(
    'hicolor-icon-theme'
    'java-runtime=17'
    'sh')
optdepends=(
    'cups: for print support'
    'gvfs: for importing pre-filled data from a gov.br account')
makedepends=(
    'icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/irpf/arquivos/IRPF${pkgver%%.*}-${pkgver#*.}.zip"
        'irpf.desktop'
        'irpf.sh'
        'LICENSE')
sha256sums=('c4532067f70e089819d525f13a79141b4bddeb8c633fde60c0b9f5c086891655'
            'eba076c583f758df2d7dcf4b0286987f217b3ddba0e7248a0cadc81f520d7015'
            '74012beb184f930cedf879cbcb47852e6d571f18ed2c496fc46bd9fe2edbe526'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    wrestool -x -t 14 -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"
    icotool -x -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"_*_*_*.ico
}

package() {
    install -D -m755 irpf.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 irpf.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "IRPF${pkgver%%.*}"/{{irpf,pgd-updater-*.*.*}.jar,IRPF.acb} -t "${pkgdir}/usr/share/java/${pkgname}"
    install -D -m644 "IRPF${pkgver%%.*}/Leia-me.htm" -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "IRPF${pkgver%%.*}/"lib{,-modulos} "${pkgdir}/usr/share/java/${pkgname}"
    ln -sr "${pkgdir}/usr/share/doc/${pkgname}/help" "${pkgdir}/usr/share/java/${pkgname}/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find "IRPF${pkgver%%.*}" -maxdepth 1 -type f -name "IRPF${pkgver%%.*}.exe"_*_*_*_*_*x*x*.png -print0)
}
