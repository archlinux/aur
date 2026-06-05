# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=irpf2025
pkgver=2025.1.8
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) program (2025 version)'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/dirpf'
license=('LicenseRef-Custom')
depends=(
    'hicolor-icon-theme'
    'java-runtime=11'
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
sha256sums=('8a225b26acf4bea40118d6a2502d889e875e9687c25391e1648632638047c34c'
            '258f86f0f62d822e97d97c5f6206333b7e792be25fb5d056383efbb12d613d3a'
            '330209f61e7edc67fafb4b52a077554b177872f021606d07247906f2dd429021'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    wrestool -x -t 14 -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"
    icotool -x -o "IRPF${pkgver%%.*}" "IRPF${pkgver%%.*}/IRPF${pkgver%%.*}.exe"_*_*_*.ico
}

package() {
    install -D -m755 irpf.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 irpf.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "IRPF${pkgver%%.*}"/{{irpf,pgd-updater}.jar,IRPF.acb} -t "${pkgdir}/usr/share/java/${pkgname}"
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
