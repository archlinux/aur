# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcar2024
pkgver=2024.1.1
pkgrel=3
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for getting rural activity results (2024 version)'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/lcar'
license=('LicenseRef-Custom')
depends=(
    'hicolor-icon-theme'
    'java-runtime'
    'sh')
optdepends=(
    'cups: for print support')
makedepends=(
    'icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/ar/AR${pkgver%%.*}v${pkgver#*.}.zip"
        'lcar.desktop'
        'lcar.sh'
        'LICENSE')
sha256sums=('f7864419d948e8aef9e1fbf90e51fb818b32beecbfad249fc26d91c9b0970af8'
            'b20793fc7fe3d1fd32ff3cf18c54b44bc58e77a450dfce6465dc34b6b15ae238'
            '6649e97b258ce2b1fbcd167dc517077430b661a9b4f93449fec19a21fc9420ac'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "AR${pkgver%%.*}" "AR${pkgver%%.*}/RFB.ico"
}

package() {
    install -D -m755 lcar.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 lcar.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "AR${pkgver%%.*}"/{{PgdAtividadeRural,pgd-updater}.jar,ARURAL.acb} -t "${pkgdir}/usr/share/java/${pkgname}"
    install -D -m644 "AR${pkgver%%.*}/Leia_me.htm" -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "AR${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "AR${pkgver%%.*}/lib" "${pkgdir}/usr/share/java/${pkgname}"
    ln -sr "${pkgdir}/usr/share/doc/${pkgname}/help" "${pkgdir}/usr/share/java/${pkgname}/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find "AR${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_*_*x*x*' -print0)
}
