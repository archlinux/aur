# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gcap
pkgver=2023.1.1
pkgrel=2
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for calculation of capital gains'
arch=('any')
url='https://www.gov.br/pt-br/servicos/apurar-imposto-sobre-ganhos-de-capital'
license=('custom')
depends=('sh' 'java-runtime=11' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("https://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/gcap/GCAP${pkgver%%.*}v${pkgver#*.}.zip"
        'gcap.desktop'
        'gcap.sh'
        'LICENSE')
sha256sums=('d4eaa3e3d6c53be95d1694302a514b40592bf10fd4234bf1f0d7c68a3911e0a5'
            '24df966f1dbf8c348b487a1724891271a92b6e795b981fdf0c5b430325722af7'
            '905b2f02237fadb186e6b13e3412daa921d77b43b5975e7f25bee45f72136f8b'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x -o "GCAP${pkgver%%.*}" "GCAP${pkgver%%.*}/RFB_GCAP.ico"
}

package() {
    install -D -m755 gcap.sh "${pkgdir}/usr/bin/gcap"
    install -D -m644 gcap.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 "GCAP${pkgver%%.*}/GCAP.jar" "${pkgdir}/usr/share/java/gcap/gcap.jar"
    install -D -m644 "GCAP${pkgver%%.*}/pgd-updater.jar" -t "${pkgdir}/usr/share/java/gcap"
    install -D -m644 "GCAP${pkgver%%.*}/Leia_me.htm" -t "${pkgdir}/usr/share/doc/gcap"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/gcap"
    cp -dr --no-preserve='ownership' "GCAP${pkgver%%.*}/lib" "${pkgdir}/usr/share/java/gcap"
    ln -s ../../doc/gcap/help "${pkgdir}/usr/share/java/gcap/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(sed 's/\.png$//;s/^.*_//;s/x.*$//' <<< "$_file")"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/gcap.png"
    done < <(find "GCAP${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_GCAP_*_*x*x*.png' -print0)
}
