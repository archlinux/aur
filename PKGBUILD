# Maintainer: oliwierw <oliwierw %at% nazwa ^dot^ ovh>

pkgname=ath11k-bad-wifi7-compat-dkms
pkgver=7.1.5.arch1
pkgrel=1
pkgdesc='Off-spec patch for ath11k handling invalid HE MCS rates (>11) received from WiFi 7 APs, preventing connection loss'
arch=('x86_64')
url='https://wireless.wiki.kernel.org/en/users/drivers/ath11k'
license=('GPL-2.0-only')
depends=('dkms')
_srcname=linux-${pkgver%.*}

source=(
    "https://cdn.kernel.org/pub/linux/kernel/v7.x/${_srcname}.tar.xz"
    "${pkgname}.patch"
    "dkms.conf"
)
noextract=("${_srcname}.tar.xz")
sha256sums=(
    '22a0196b3cbcdf34dc27b77561f4d040585fd3447edc9ab3531a1ac79e3041e7'
    '297f5f02cc8cb2c350ff29f80ee1e34a28e0c8da5402edc1044bb660ffc4cae8'
    '76a3a5e4ac09e63c3236eded1c05595931a8976c978cd89685b3be524eb79c4b'
)

prepare() {
    tar -xf "${srcdir}/${_srcname}.tar.xz" \
        --wildcards --strip-components=1 \
        "${_srcname}/drivers/net/wireless/ath/ath11k" \
        "${_srcname}/drivers/net/wireless/ath/spectral_common.h" \
        "${_srcname}/drivers/net/wireless/ath/testmode_i.h" \
        -C "${srcdir}"
    patch -Np1 -d "${srcdir}" -i "${srcdir}/${pkgname}.patch"
}

package() {
    local dst="${pkgdir}/usr/src/${pkgname%-dkms}-${pkgver}"
    install -dm755 "${dst}"

    cp -r "${srcdir}/drivers/net/wireless/ath/ath11k" "${dst}/"
    install -m644 "${srcdir}/drivers/net/wireless/ath/spectral_common.h" "${dst}/"
    install -m644 "${srcdir}/drivers/net/wireless/ath/testmode_i.h" "${dst}/"

    sed "s/@PKGVER@/${pkgver}/" "${srcdir}/dkms.conf" > "${dst}/dkms.conf"
}
