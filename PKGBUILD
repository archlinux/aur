# Maintainer: Brice Vissière <dev at pystash dot me>
pkgname=mdatp-bin
_actual_pkgname=mdatp
pkgver=101.25092.0002
pkgrel=0
pkgdesc='Microsoft Defender Advanced Threat Protection for Endpoints'
arch=('x86_64')
license=('custom: commercial')
provides=("$_actual_pkgname=$pkgver")
install=mdatp.install
url=https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/linux-install-manually

depends=(systemd)

source=(
    "https://packages.microsoft.com/debian/12/prod/pool/main/m/${_actual_pkgname}/${_actual_pkgname}_${pkgver}_amd64.deb"
    mdatp-user.conf
)

sha256sums=(
    'c3c9f4384bd99866fcad3f82733448bbec2a2dfb8c49109fc501248255a9ceaf'
    'd516a208a443dd35716250f9a9ef9b12f7e752ba91a213c70cb4592ab8c0435c')

prepare() {
    ar x "${_actual_pkgname}_${pkgver}_amd64.deb"
    tar -zxvf data.tar.gz
}

package() {
    install -d "${pkgdir}/opt/microsoft/${_actual_pkgname}"
    install -d "${pkgdir}/var/opt/microsoft"
    install -d "${pkgdir}/var/log/microsoft"
    install -d "${pkgdir}/etc/systemd/system"
    install -d "${pkgdir}/usr/bin"
    install -Dm644 "$srcdir"/mdatp-user.conf "$pkgdir"/usr/lib/sysusers.d/mdatp.conf
    cp -r "${srcdir}/opt/microsoft/${_actual_pkgname}/"* "${pkgdir}/opt/microsoft/${_actual_pkgname}/"
    install -m644 "${srcdir}/opt/microsoft/${_actual_pkgname}/conf/mdatp.service" "${pkgdir}/etc/systemd/system/mdatp.service"
    ln -sf "/opt/microsoft/mdatp/sbin/wdavdaemonclient" "${pkgdir}/usr/bin/mdatp"
}
