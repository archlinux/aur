# Maintainer: Martin Dünkelmann <nc-duenkekl3@netcologne.de>
pkgname=kyocera-sane
pkgver=2.0.0326
pkgrel=1
pkgdesc="Kyocera sane scanner support package for many Kyocera printers."
arch=('x86_64')
url="https://www.kyocera.com/"
license=('custom')
depends=('glibc' 'libusb' 'libtiff4' 'openssl-1.0' 'sane')
makedepends=('unzip' 'wget')
source=("https://www.kyoceradocumentsolutions.de/content/download-center/de/drivers/all/SANE_Driver_zip.download.zip")
sha256sums=('4bf3f83b0cec6531e794151c076586fcc0f4262fdffa9f2a465ce684aff6f90a')

prepare() {
    cd ${srcdir}
    unzip -o SANE_Driver_zip.download.zip
    ar xv ${pkgname}_${pkgver}_amd64.deb
}

package() {
    cd ${pkgdir}

    tar xzf ${srcdir}/data.tar.gz -C .

    # clean unnecessary files
    rm usr/share/doc/${pkgname}/changelog.Debian.gz
    rm usr/lib/sane/libsane-kyocera.so.1
    rm usr/lib/sane/libsane-kyocera_gdi_a3.so.1
    rm -rf usr/lib/x86_64-linux-gnu
    rm -rf usr/local

    # fix licence warning
    mkdir -p usr/share/licenses/${pkgname}
    mv usr/share/doc/${pkgname}/copyright usr/share/licenses/${pkgname}/COPYRIGHT

    # from deb preinst
    #chmod 1770 usr/local/kyocera
    #chmod 1770 usr/local/kyocera/scanner

    # from deb postinst
    mkdir -p etc/sane.d/dll.d/
    touch etc/sane.d/dll.d/kyocera.conf
    echo 'kyocera' >> etc/sane.d/dll.d/kyocera.conf
    echo 'kyocera_gdi_a3' >> etc/sane.d/dll.d/kyocera.conf
    echo 'kyocera_wc3' >> etc/sane.d/dll.d/kyocera.conf
    echo 'kyocera_wc3_usb' >> etc/sane.d/dll.d/kyocera.conf

    #ln -s usr/local/kyocera/scanner/libssl.so.1.0.0 /usr/lib/libssl.so.1.0.0
    #ln -s usr/local/kyocera/scanner/libcrypto.so.1.0.0 /usr/lib/libcrypto.so.1.0.0
    #ln -s usr/local/kyocera/scanner/libjpeg.so.8.0.2 /usr/lib/libjpeg.so.8
    #ln -sf usr/local/kyocera/scanner/libtiff.so.4.3.4 /usr/lib/libtiff.so.4

    #ldconfig
}