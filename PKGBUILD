# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcar2024
pkgver=2024.1.1
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for getting rural activity results'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/lcar'
license=('LicenseRef-Custom')
depends=('sh' 'java-runtime' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/ar/AR${pkgver%%.*}v${pkgver#*.}.zip"
        'lcar.desktop'
        'lcar.sh'
        'LICENSE')
sha256sums=('f7864419d948e8aef9e1fbf90e51fb818b32beecbfad249fc26d91c9b0970af8'
            'ae58d1c3d3974870ddef734b1a3c02dbca0363db7345c7b80e5c401ae9edbead'
            'cdeed2f6f2241b5d5ef947fad36091141867eedefbc4a143717d463f942dd94e'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "AR${pkgver%%.*}" "AR${pkgver%%.*}/RFB.ico"
}

package() {
    install -D -m755 lcar.sh "${pkgdir}/usr/bin/lcar2024"
    install -D -m644 lcar.desktop "${pkgdir}/usr/share/applications/lcar2024.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "AR${pkgver%%.*}"/{PgdAtividadeRural,pgd-updater}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
    install -D -m644 "AR${pkgver%%.*}/Leia_me.htm" -t "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "AR${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/${pkgname}"
    cp -dr --no-preserve='ownership' "AR${pkgver%%.*}/lib" "${pkgdir}/usr/share/java/${pkgname}"
    ln -s "../../doc/${pkgname}/help" "${pkgdir}/usr/share/java/${pkgname}/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/${pkgname}.png"
    done < <(find "AR${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_*_*x*x*' -print0)
}
