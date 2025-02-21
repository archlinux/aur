# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcar
pkgver=2025.1.0
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
sha256sums=('afe894ada5a7d9d2dba894e4e24dd32aab7625fd9a8b9f6fe7af9f67f2f8df5f'
            'e7e3731f2a3d6c5d9b0fce886be40a3ab74ae5e688be79462bb03d74159f0f16'
            'c3a773b9d773e300a4d9ab077eea584d5dfeedf1960fa17db0afb1d55869730d'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "AR${pkgver%%.*}" "AR${pkgver%%.*}/RFB.ico"
}

package() {
    install -D -m755 lcar.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 lcar.desktop -t "${pkgdir}/usr/share/applications"
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
