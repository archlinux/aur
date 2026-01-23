# Maintainer: taotieren <admin@taotieren.com>

pkgname=thunder-nas-bin
_tagname=4.0.0-beta
pkgver=${_tagname//-/_}
pkgrel=3
pkgdesc="Thunder (Xunlei) remote download service program extracted from thunder Synology suite for other devices"
arch=($CARCH)
url="https://github.com/cnk3x/xunlei"
license=('MIT')
provides=(${pkgname%-bin})
conflicts=(${pkgname%-bin})
#replaces=(${pkgname})
depends=()
makedepends=()
optdepends=()
backup=()
options=('!strip' '!debug')
install=${pkgname}.install
source=(
    "xlp-${_tagname//-/}-linux-amd64.tar.gz::${url}/releases/download/v${_tagname}/xlp-${_tagname//-/}-linux-amd64.tar.gz"
    "xlp-${_tagname//-/}-linux-arm64.tar.gz::${url}/releases/download/v${_tagname}/xlp-${_tagname//-/}-linux-arm64.tar.gz"
    "https://github.com/cnk3x/xunlei/raw/refs/heads/main/LICENSE"
    thunder-nas.{sysusers,tmpfiles,service}
)
sha256sums=('d01f33b733ce1715f6c546980bee72c82c32f2b0020a2c37d8e70c9d7ab9515f'
            '904870ea068865261c21b62fcf0ad03355a97711bb1f4f4b78ae940716a14880'
            'eabe4ae8a7885a2d00da4bbfb18e9a55b8fba68bb8d0d06d3701a6bf6726faef'
            '5dc4361777cb9655f04eba77e13b15f32078a45e2eec3642560db1d4b7a4d8bb'
            '1bec7483c5de2298305ad715759357e32ac2bbae25d8273351763750a2ddc12d'
            '3566c4c5dc365998c9a5e59f9935e103e823597c1271dfdcfb10d2b49baed724')

package() {
    if [ ${CARCH} = "x86_64" ]; then
        install -vDm755 "${srcdir}/xlp" "${pkgdir}/usr/bin/${pkgname%-bin}"
        install -Dm644 /dev/stdin "${pkgdir}/etc/syno.conf" <<EOF
platform_name="geminilake"
synobios="geminilake"
unique="synology_geminilake_DS920+"
EOF
    fi
    if [ ${CARCH} = "aarch64" ]; then
        install -vDm755 "${srcdir}/xlp" "${pkgdir}/usr/bin/${pkgname%-bin}"
        install -Dm644 /dev/stdin "${pkgdir}/etc/syno.conf" <<EOF
platform_name="rtd1296"
synobios="rtd1296"
unique="synology_rtd1296_DS220j"
EOF
    fi
    install -vDm0644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"

    install -vdm777 "${pkgdir}/var/lib/thunder-nas" \
        "${pkgdir}/usr/syno/synoman/webman/modules" \
        "${pkgdir}/var/packages/pan-xunlei-com"

    install -Dvm644 "${srcdir}/thunder-nas.sysusers" "${pkgdir}/usr/lib/sysusers.d/thunder-nas.conf"
    install -Dvm644 "${srcdir}/thunder-nas.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/thunder-nas.conf"
    install -vDm644 "${srcdir}/thunder-nas.service" -t "${pkgdir}/usr/lib/systemd/system/"
}
