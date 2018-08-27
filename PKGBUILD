# Maintainer: Chih-Hsuan Yen <yan12125@gmail.com>

pkgname=pulse-secure
pkgver=9.0r1.0_b739
pkgrel=1
pkgdesc='Pulse Connect Secure (PCS) Client'
arch=(x86_64)
license=(custom)
url='https://www.pulsesecure.net/'
depends=(gcc-libs libgnome-keyring)
source=(pulseUi.sh
        EULA.txt)
source_x86_64=("http://ccnet.ntu.edu.tw/vpn/Download/ps-pulse-linux-${pkgver/_/-}-centos-rhel-64-bit-installer.rpm")
md5sums=('d81155461e2666c2b9d669c1b76f85fe'
         '261848a28201e5386ec4bf587473a48b')
md5sums_x86_64=('6739ff87ec6948c5dacdbe84971c522b')
optdepends=('webkitgtk: for pulseUi frontend'
            'psmisc: for pulsesvc -K')
conflicts=(pulse-connect-secure)

prepare() {
    mkdir -p pulse && cd pulse
    tar -zxvf ../usr/local/pulse/pulse.tgz
}

# adapted from ConfigurePulse_x86_64.sh
update_build_info() {
    pkgdir=$1

    INSTALLDIR="$pkgdir"/usr/local/pulse

    BUILD_VERSION=${pkgver%_b*}
    BUILD_NUMBER=${pkgver#*_b}

    sed -i "s/BUILD_VERSION/${BUILD_VERSION}/g" "${INSTALLDIR}/html/about.html"
    sed -i "s/BUILD_NUMBER/${BUILD_NUMBER}/g" "${INSTALLDIR}/html/about.html"
}

package() {
    install -Ddm755 "${pkgdir}"/usr/bin
    install -Ddm755 "${pkgdir}"/usr/local/pulse
    install -Ddm755 "${pkgdir}"/usr/share/applications
    install -Ddm755 "${pkgdir}"/usr/share/licenses/$pkgname

    install -Dm755 usr/local/pulse/PulseClient_x86_64.sh "${pkgdir}"/usr/local/pulse/
    install -Dm644 usr/local/pulse/{README,version.txt} "${pkgdir}"/usr/local/pulse/
    install -Dm755 pulse/pulseutil "${pkgdir}"/usr/local/pulse/
    install -Dm4755 pulse/pulsesvc "${pkgdir}"/usr/local/pulse/
    install -Dm755 pulse/pulseUi_centos_7_x86_64 "${pkgdir}"/usr/local/pulse/pulseUi
    install -Dm755 pulse/libpulseui.so_centos_7_x86_64 "${pkgdir}"/usr/local/pulse/libpulseui.so
    install -Dm644 pulse/pulseUi.desktop "${pkgdir}"/usr/share/applications/

    # Wrappers & symlinks
    install -Dm755 pulseUi.sh "${pkgdir}"/usr/bin/pulseUi
    ln -s /usr/local/pulse/pulsesvc "${pkgdir}"/usr/bin/pulsesvc

    cp -dr --no-preserve=ownership pulse/html "${pkgdir}"/usr/local/pulse/html

    install -Dm644 EULA.txt "${pkgdir}"/usr/share/licenses/$pkgname/

    update_build_info "$pkgdir"
}
