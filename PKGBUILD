# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=gcap
pkgver=2020.1.0
pkgrel=1
pkgdesc='Brazilian physical person income tax (IRPF) auxiliary program for calculation of capital gains'
arch=('any')
url='https://receita.economia.gov.br/orientacao/tributaria/pagamentos-e-parcelamentos/pagamento-do-imposto-de-renda-de-pessoa-fisica/ganho-de-capital/programa-de-apuracao-de-ganhos-de-capital-moeda-nacional/'
license=('unknown')
depends=('sh' 'java-runtime' 'hicolor-icon-theme')
makedepends=('icoutils')
source=("http://downloadirpf.receita.fazenda.gov.br/irpf/${pkgver%%.*}/gcap/GCAP${pkgver%%.*}v${pkgver#*.}.zip"
        'gcap.desktop'
        'gcap.sh')
sha256sums=('3d5cccf4488455be83150e9c81aede1aca4e119e86c98fbc813ae8286e1708d4'
            '24df966f1dbf8c348b487a1724891271a92b6e795b981fdf0c5b430325722af7'
            '2c50b3d5df01139ce2c41b5be2ee6d34f29313de131defdf8db600d6b58b9129')

prepare() {
    icotool -x "GCAP${pkgver%%.*}/RFB_GCAP.ico" -o "GCAP${pkgver%%.*}"
}

package() {
    mkdir -p "${pkgdir}/usr/share/doc/gcap"
    install -D -m755 gcap.sh "${pkgdir}/usr/bin/gcap"
    install -D -m644 gcap.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 "GCAP${pkgver%%.*}/GCAP.jar" "${pkgdir}/usr/share/java/gcap/gcap.jar"
    install -D -m644 "GCAP${pkgver%%.*}/pgd-updater.jar" -t "${pkgdir}/usr/share/java/gcap"
    install -D -m644 "GCAP${pkgver%%.*}/Leia_me.htm" -t "${pkgdir}/usr/share/doc/gcap"
    cp -a "GCAP${pkgver%%.*}/help" "${pkgdir}/usr/share/doc/gcap"
    cp -a "GCAP${pkgver%%.*}/lib" "${pkgdir}/usr/share/java/gcap"
    ln -s ../../doc/gcap/help "${pkgdir}/usr/share/java/gcap/help"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(printf '%s' "$_file" | sed 's/\.png$//;s/^.*_//;s/x.*$//')"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/gcap.png"
    done < <(find "GCAP${pkgver%%.*}" -maxdepth 1 -type f -name 'RFB_GCAP_*_*x*x*.png' -print0)
}
