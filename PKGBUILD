# Maintainer: Brice Vissière <dev at pystash dot me>
pkgname=mdatp-bin
_actual_pkgname=mdatp
pkgver=101.25032.0010
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
    '9aa7b472840c59350396306a9b0672d6972ccfbb3b7a81023a3e1d3539b96b94'
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
