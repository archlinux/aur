# Maintainer: Christos Nouskas <nous%archlinux.us>
# Adapted from dkms-mt7601u-latest by Freyermuth Julien <julien.chipster@archlinux.fr>

_pkgname=mt7601u-ap
pkgname=${_pkgname}-dkms
pkgver=3.0.0.3
_pkg=${_pkgname}-${pkgver}
pkgrel=1
pkgdesc="Kernel module for Ralink MT7601U chipset wireless adaptors with Access Point (AP / Master) support."
arch=('any')
url="http://www.ralinktech.com"
license=('GPL')
depends=('dkms')
conflicts=()
install=${pkgname}.install
options=(!strip)
source=("https://github.com/housq/mt7601u/archive/master.zip"
#http://www.mediatek.com/AmazonS3/Downloads/linux/DPO_MT7601U_LinuxSTA_3.0.0.4_20130913.tar.bz2"
#        "https://mt7601-openwrt.googlecode.com/hg/patches/001-DPO_MT7601U_LinuxSTA_3.0.0.4_20130913-Linux-3.17.0-v2.patch"
#        "https://mt7601-openwrt.googlecode.com/hg/patches/002-rt2870-mt7601Usta-kuid_t-kgid_t.patch"
        "mt7601u-ap.conf"
        "dkms.conf")

sha256sums=('952e6200163132fd1ee3f01b739b842129dfc05282e6366c80ac191d87b38da6'
            '5cb57146dcbc238feff1c0e1836dea995c33180892327eba02804a0755ce9a81'
            'a4d4f94c9492f344d4baa05d5f5ce132eb3bf0f9fb6eec161a87eea9450ebc12')

prepare() {
    rm -rf "${srcdir}/mt7601u-master"
    cd "${srcdir}"
    unzip master.zip
    mv  "${srcdir}/mt7601u-master" "${srcdir}/${_pkg}/"
}

build() {
    #gcc 4.9 adds -Werror=date-time, which Linux has enabled in its build.
    cd "${srcdir}/${_pkg}/"
    DATE=$(date +%d-%m-%Y);
    TIME=$(date +%z);
    sed -i "s|__DATE__|\"$DATE\"|g" src/sta/sta_cfg.c
    sed -i "s|__TIME__|\"$TIME\"|g" src/sta/sta_cfg.c
    sed -ri "s/^(SSID=).*/\1RA_11N_AP/" etc/Wireless/RT2870AP/RT2870AP.dat
    sed -ri "s/^(WPAPSK=).*/\1ChangeMeNOW/" etc/Wireless/RT2870AP/RT2870AP.dat
}

package() {

    installDir="${pkgdir}/usr/src/${_pkgname}-$pkgver"
    install -dm755 "${pkgdir}/etc/Wireless/RT2870AP"
    install -dm755 "${pkgdir}/etc/modprobe.d"
    install -dm755 "$installDir"
    install -m644 "${srcdir}/dkms.conf" "$installDir"
    install -m644 "${srcdir}/mt7601u-ap.conf" "${pkgdir}/etc/modprobe.d/"
    install -m644 "${srcdir}/${_pkg}/etc/Wireless/RT2870AP/RT2870AP.dat" "${pkgdir}/etc/Wireless/RT2870AP/"

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
