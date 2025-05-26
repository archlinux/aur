# $Id$
# Maintainer : Tyler Holinka <arch at tholinka dot dev>

# dell-unified-driver seems to be based on samsung-unified-driver, but with some dell-only differences (specifically in the rastertospl filter that causes issues when printing if using the filter provided by samsung-unified-driver)
pkgbase=dell-unified-driver
pkgname=( 'dell-unified-driver-common'
          'dell-unified-driver-printer'
          'dell-unified-driver-scanner'
          'dell-unified-driver')
pkgdesc="Drivers for Dell Printers and scanners Model #'s: s1130n 1130 1133 1135n 1815 2145cn 2335dn 2355dn 5330 B1160 B1160w B1165nfw B1260dn B1265dfw B1265dnf B2365dnf"
url="http://www.dell.com/support/home/us/en/19/drivers/driversdetails?driverId=C10W1"
license=('custom:dell')
pkgver=1.03
pkgrel=5
arch=('i686' 'x86_64')
# this is the newest version found after a quick search
source=("$pkgname-$pkgver.tar.gz::https://downloads.dell.com/FOLDER01511597M/1/B1265dnf_Linux_v${pkgver}_Driver.tar.gz"
        "xerox_mfp-smfp.conf"
        "60_smfp_samsung.rules"
        "61_smfp_samsung.rules")
sha256sums=('a1aa742cd266f60ae756c5678cdc27ee5be788d3ec088694f2bd03efffc17e36'
            'b9472081403c05590c2b187db3f3e9825fd0e9dfa5ff12b6c574d802f2673d03'
            '490cd00d5f06243268940de90d9f1e402a67465bdc3a86dfc3466408e8d2007f'
            '53c603095748f9f554927ba8ea753a3c7913bcc45a6f701f41d307613f402d30')

_arch=${CARCH/i686/i386}

if [ $_arch = "x86_64" ]; then
    _libdir=lib64
else
    _libdir=lib
fi

prepare() {
    cd "cdroot"
}

package_dell-unified-driver()
{
    depends=('dell-unified-driver-printer'
             'dell-unified-driver-scanner')
}

package_dell-unified-driver-common()
{
    install -Dm644 "$srcdir"/cdroot/Linux/noarch/eula/eula.htm "$pkgdir"/usr/share/licenses/"$pkgbase"/LICENSE
    install -Dm644 "$srcdir"/cdroot/Linux/noarch/eula/eula-fr.htm "$pkgdir"/usr/share/licenses/"$pkgbase"/eula-fr.txt
}

package_dell-unified-driver-printer()
{
    conflicts=('samsung-unified-driver-printer')
    depends=('dell-unified-driver-common' 'cups' 'ghostscript')
    replaces=('dell-unified-printer-driver')

    # thank you driggs39 from here https://www.dell.com/community/Printers/b1165nfw-Linux-installer-modifies-important-files-damages-system/m-p/4414245#M80350
    install -Dm755 "$srcdir"/cdroot/Linux/"$_arch"/mfp          "$pkgdir"/usr/lib/cups/backend/mfp

    _filters=(pstosecps pstospl pstosplc rastertospl rastertosplc)
    for i in ${_filters[@]}; do
        install -Dm755 "$srcdir"/cdroot/Linux/"$_arch"/"$i"     "$pkgdir"/usr/lib/cups/filter/"$i"
    done

    install -Dm755 "$srcdir"/cdroot/Linux/"$_arch"/libscmssc.so "$pkgdir"/usr/lib/libscmssc.so

    _ppdmodels=(1130n 1130 1133 1135n 1815 2145cn 2335dn 2355dn 5330 B1160 B1160w B1165nfw B1260dn B1265dfw B1265dnf B2365dnf)
    for i in ${_ppdmodels[@]}; do
        # save some space
        gzip < "$srcdir"/cdroot/Linux/noarch/at_opt/share/ppd/"$i".ppd > $srcdir/cdroot/Linux/noarch/at_opt/share/ppd/"$i".ppd.gz
        install -Dm644 "$srcdir"/cdroot/Linux/noarch/at_opt/share/ppd/"$i".ppd.gz "$pkgdir"/usr/share/cups/model/dell/"$i".ppd.gz
    done

    _ctsmodels=(B1160sc  B1160wsc  B1165nfwsc  B1260dnsc  B1265dfwsc  B1265dnfsc)
    for i in ${_ctsmodels[@]}; do
        install -Dm644 "$srcdir"/cdroot/Linux/noarch/at_opt/share/ppd/cms/"$i".cts "$pkgdir"/usr/share/cups/model/dell/cms/"$i".cts
    done
}

package_dell-unified-driver-scanner()
{
    conflicts=('samsung-unified-driver-scanner')
    depends=('dell-unified-driver-common' 'libxml2.so=2' 'libusb-compat' 'sane')
    install=dell-unified-driver-scanner.install

    _locales=(ru fr)
    for i in ${_locales[@]}; do
        install -Dm644 "$srcdir"/cdroot/Linux/noarch/at_root/usr/share/locale/"$i"/LC_MESSAGES/sane-smfp.mo "$pkgdir"/usr/share/locale/"$i"/LC_MESSAGES/sane-smfp.mo
    done

    install -Dm644 "$srcdir"/cdroot/Linux/noarch/at_root/etc/sane.d/smfp.conf "$pkgdir"/etc/sane.d/smfp.conf
    install -Dm644 "$srcdir"/xerox_mfp-smfp.conf                              "$pkgdir"/etc/sane.d/xerox_mfp-smfp.conf

    mkdir "$pkgdir"/etc/sane.d/dll.d
    echo "smfp" >           "$pkgdir"/etc/sane.d/dll.d/smfp-scanner
    echo "xerox_mfp-smfp" > "$pkgdir"/etc/sane.d/dll.d/smfp-scanner-fix


    install -Dm755 "$srcdir"/cdroot/Linux/"$_arch"/at_root/usr/"$_libdir"/sane/libsane-smfp.so.1.0.1 "$pkgdir"/usr/lib/sane/libsane-smfp.so.1.0.1
    ln -s libsane-smfp.so.1.0.1                                                                      "$pkgdir"/usr/lib/sane/libsane-smfp.so.1
    ln -s libsane-smfp.so.1                                                                          "$pkgdir"/usr/lib/sane/libsane-smfp.so

    install -Dm755 "$srcdir"/cdroot/Linux/"$_arch"/at_root/usr/"$_libdir"/libmfp.so.1.0.1 "$pkgdir"/usr/lib/libmfp.so.1.0.1
    ln -s libmfp.so.1.0.1 "$pkgdir"/usr/lib/libmfp.so.1
    ln -s libmfp.so.1     "$pkgdir"/usr/lib/libmfp.so

    # install the old bundled version of libnetsnmp
    install -Dm755 "$srcdir"/cdroot/Linux/"$_arch"/at_root/opt/smfp-common/lib/libnetsnmp.so.10.0.2 "$pkgdir"/usr/lib/libnetsnmp.so.10.0.2
    ln -s libnetsnmp.so.10.0.2 "$pkgdir"/usr/lib/libnetsnmp.so.10

    _udevrules=(60_smfp_samsung 61_smfp_samsung)
    for i in ${_udevrules[@]}; do
        install -Dm644 "$srcdir"/"$i".rules "$pkgdir"/usr/lib/udev/rules.d/"$i".rules
    done

    # note: you may need to create a /etc/udev/rules.d/40-libsane.rules with the following: ATTRS{idVendor}=="AAAA", ATTRS{idProduct}=="BBBB", ENV{libsane_matched}="yes" with AAAA BBBB coming from sane-find-scanner or lsusb
    # see here: https://askubuntu.com/a/178855
}
