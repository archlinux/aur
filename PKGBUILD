# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gcap
pkgver=2023.1.1
pkgrel=1
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
            '2c50b3d5df01139ce2c41b5be2ee6d34f29313de131defdf8db600d6b58b9129'
            'a406e102e2c10c202bd7a0ba775b004c0f04440544db73ce6923172a62aacd67')

prepare() {
    icotool -x "GCAP${pkgver%%.*}/RFB_GCAP.ico" -o "GCAP${pkgver%%.*}"
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
        _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*_//;s/x.*$//')"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/gcap.png"
    done < <(find "GCAP${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_GCAP_*_*x*x*.png' -print0)
}
