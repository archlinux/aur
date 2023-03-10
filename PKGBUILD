# Maintainer: Brice Vissière <dev at pystash dot me>
pkgname=mdatp-bin
_actual_pkgname=mdatp
pkgver=101.98.05
pkgrel=0
pkgdesc='Microsoft Defender Advanced Threat Protection for Endpoints'
arch=('x86_64')
license=('custom: commercial')
provides=("$_actual_pkgname=$pkgver")
install=mdatp.install
url=https://docs.microsoft.com/en-us/microsoft-365/security/defender-endpoint/linux-install-manually

# libselinux was apparently the sole missing dependency on my system
# btw, libselinux is from AUR
depends=(systemd libselinux)

source=(
    "https://packages.microsoft.com/debian/11/prod/pool/main/m/${_actual_pkgname}/${_actual_pkgname}_${pkgver}.amd64.deb"
    mdatp-user.conf
)

sha256sums=('7e1ba007e40c4653ca8b8bdf55e29600a08ac87217267e3b78417dd8a0be1cf3'
            'd516a208a443dd35716250f9a9ef9b12f7e752ba91a213c70cb4592ab8c0435c')

prepare() {
    ar x "mdatp_$_actual_pkgname_$pkgver.amd64.deb"
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
