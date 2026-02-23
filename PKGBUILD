# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=lcar
pkgver=2026.1.1
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for getting rural activity results'
arch=('any')
url='https://www.gov.br/receitafederal/pt-br/centrais-de-conteudo/download/pgd/lcar'
license=('LicenseRef-Custom')
depends=(
    'hicolor-icon-theme'
    'java-runtime'
    'sh')
makedepends=(
    'icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/ar/AR${pkgver%%.*}v${pkgver#*.}.zip"
        'lcar.desktop'
        'lcar.sh'
        'LICENSE')
sha256sums=('693515ad355b96a78fa7ab6d4e1ecce7830876bffa3df728938f224fe10f056e'
            'fb61ffa205784f53a159d781b077fd772457f3fb0937b6c73653cfbc9613b33d'
            'c3a773b9d773e300a4d9ab077eea584d5dfeedf1960fa17db0afb1d55869730d'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "AR${pkgver%%.*}" "AR${pkgver%%.*}/RFB.ico"
}

package() {
    install -D -m755 lcar.sh "${pkgdir}/usr/bin/${pkgname}"
    install -D -m644 lcar.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "AR${pkgver%%.*}"/{PgdAtividadeRural,pgd-updater}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
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
