# Maintainer: Christos Nouskas <nous%archlinux.us>
# Adapted from dkms-mt7601u-latest by Freyermuth Julien <julien.chipster@archlinux.fr>

_pkgname=mt7601u
pkgname=${_pkgname}-dkms
pkgver=3.1
_pkg=${_pkgname}-${pkgver}
pkgrel=1
pkgdesc="Kernel module for MediaTek MT7601U USB dongles, written from scratch based on the vendor GPL-driver. Unlike the vendor driver this driver uses modern Linux WiFi infrastructure and should work flawlessly with NetworkManager, wicd, wpa_supplicant and such."
arch=('any')
url="http://www.ralinktech.com"
license=('GPL')
depends=('linux-headers>=3.19' 'dkms')
conflicts=('dkms-mt7601u' 'mt7601u-ap-dkms' 'dkms-mt7601u-latest' )
install=${pkgname}.install
options=(!strip)
source=("https://github.com/kuba-moo/mt7601u/archive/master.zip"
        "http://www.mediatek.com/AmazonS3/Downloads/linux/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2"
#        "https://mt7601-openwrt.googlecode.com/hg/patches/001-DPO_MT7601U_LinuxSTA_3.0.0.4_20130913-Linux-3.17.0-v2.patch"
#        "https://mt7601-openwrt.googlecode.com/hg/patches/002-rt2870-mt7601Usta-kuid_t-kgid_t.patch"
        "${_pkgname}.conf"
        "dkms.conf")
noextract=('DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2')

prepare() {
    rm -rf "${srcdir}/mt7601u-master"
    cd "${srcdir}"
    unzip master.zip
    tar jxf DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2 ./DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/mcu/bin/MT7601.bin
    mv  "${srcdir}/mt7601u-master" "${srcdir}/${_pkg}/"
}

build() {
    #gcc 4.9 adds -Werror=date-time, which Linux has enabled in its build.
    cd "${srcdir}/${_pkg}/"
}

package() {
    echo $srcdir
    installDir="${pkgdir}/usr/src/${_pkgname}-$pkgver"
    install -dm755 "${pkgdir}/etc/modprobe.d" "${pkgdir}/usr/share/doc/${_pkgname}" \
    "${pkgdir}/usr/lib/firmware"
#    install -dm755 "${pkgdir}/usr/share/doc/${_pkgname}"
    cd "${srcdir}/${_pkg}/"
    install -dm755 "$installDir"
    install -m644 "${srcdir}/dkms.conf" "$installDir/"
    install -m644 "${srcdir}/${_pkg}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}"
    install -m644 "${srcdir}/${_pkgname}.conf" "${pkgdir}/etc/modprobe.d/"
    install -m644 "${srcdir}/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913/mcu/bin/MT7601.bin" "${pkgdir}/usr/lib/firmware/mt7601u.bin"

    cd "${srcdir}/${_pkg}/"

    for d in `find . -type d`
    do
        install -dm755 "$installDir/$d"
    done

    for f in `find . -type f -o -type l`
    do
        install -m644 "${srcdir}/${_pkg}/$f" "$installDir/$f"
    done

  # Set name and version
    sed -e "s/@_PKGNAME@/${_pkgname}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}"/usr/src/${_pkg}/dkms.conf
}
sha256sums=('SKIP'
            'SKIP'
            '16e4d1b97a128a8f92f27af3124a331327c861996c9dda0dc337a77822b8931d'
            '3035f0d88d9cc6395237064026e64df737e964fe762591bdf41c508ca7070411')
