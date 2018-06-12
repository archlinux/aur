# $Id$
# Maintainer : Tyler Holinka <TylerHolinka+arch at gmail dot com>

# dell-unified-driver seems to be based on samsung-unified-driver, but with some dell-only differences (specifically in the rastertospl that causes issues when printer if using the samsung-unified-driver one filter)
pkgbase=dell-unified-driver
pkgname=( 'dell-unified-driver-common'
          'dell-unified-driver-printer'
          'dell-unified-driver-scanner'
          'dell-unified-driver')
pkgdesc="Drivers for Dell Printers and scanners Model #'s: s1130n 1130 1133 1135n 1815 2145cn 2335dn 2355dn 5330 B1160 B1160w B1165nfw B1260dn B1265dfw B1265dnf B2365dnf"
url="http://www.dell.com/support/home/us/en/19/drivers/driversdetails?driverId=C10W1"
license=('custom:dell')
pkgver=1.03
pkgrel=1
arch=('i686' 'x86_64')
# this is the newest version found after a quick search
source=("$pkgname-$pkgver.tar.gz::https://downloads.dell.com/FOLDER01511597M/1/B1265dnf_Linux_v${pkgver}_Driver.tar.gz"
        "xerox_mfp-smfp.conf"
        "60_smfp_samsung.rules"
        "61_smfp_samsung.rules")
sha256sums=('a1aa742cd266f60ae756c5678cdc27ee5be788d3ec088694f2bd03efffc17e36'
            'e57b2f313a482d74d66329edcca70a383d83e8c9d1f93c489e7bf36f8b2b3785'
            'ddb4deaac88f3c8ab5b4529bfb4b5a37f3d972c5f4e1ac74bc141049550af8d0'
            '7991f801ec5ce1b8b5bf09dc4e1e52054c90df6d302e6da3025c63d9727ebb66')

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
        install -Dm644 "$srcdir"/cdroot/Linux/noarch/at_opt/share/ppd/"$i".ppd.gz "$pkgdir"/usr/share/cups/model/dell/"$i".ppd
    done

    _ctsmodels=(B1160sc  B1160wsc  B1165nfwsc  B1260dnsc  B1265dfwsc  B1265dnfsc)
    for i in ${_ctsmodels[@]}; do
        install -Dm644 "$srcdir"/cdroot/Linux/noarch/at_opt/share/ppd/cms/"$i".cts "$pkgdir"/usr/share/cups/model/dell/cms/"$i".cts
    done
}

package_dell-unified-driver-scanner()
{
    conflicts=('samsung-unified-driver-scanner')
    depends=('dell-unified-driver-common' 'libxml2' 'libusb-compat' 'sane')
    install=dell-unified-driver-scanner.install

    _locales=(ru fr)
    for i in ${_locales[@]}; do
        install -Dm755 "$srcdir"/cdroot/Linux/noarch/at_root/usr/share/locale/"$i"/LC_MESSAGES/sane-smfp.mo "$pkgdir"/usr/share/locale/"$i"/LC_MESSAGES/sane-smfp.mo
    done

    install -Dm755 "$srcdir"/cdroot/Linux/noarch/at_root/etc/sane.d/smfp.conf "$pkgdir"/etc/sane.d/smfp.conf
    install -Dm755 "$srcdir"/xerox_mfp-smfp.conf "$pkgdir"/etc/sand.d

    mkdir "$pkgdir"/etc/sane.d/d11.d
    echo "smpf" > "$pkgdir"/etc/sane.d/d11.d/smfp-scanner
    echo "xerox_mfp_smfp" > "$pkgdir"/etc/sane.d/d11.d/smfp-scanner-fix


    install -Dm755 "$srcdir"/cdroot/Linux/"$_arch"/at_root/usr/"$_libdir"/sane/libsane-smfp.so.1.0.1 "$pkgdir"/usr/lib/sane/libsane-smfp.so.1.0.1
    ln -s libsane-smfp.so.1.0.1 "$pkgdir"/usr/lib/sane/libsane-smfp.so.1
    ln -s libsane-smfp.so.1     "$pkgdir"/usr/lib/sane/libsane-smfp.so

    # we don't install smfpd, so this never gets uses afaik
    #install -Dm755 "$srcdir"/cdroot/Linux/"$_arch"/at_root/usr/lib/libmfp.so.1.0.1 "$pkgdir"/usr/lib/libmfp.so.1.0.1
    #ln -s libmfp.so.1.0.1 "$pkgdir"/usr/lib/libmfp.so.1
    #ln -s libmfp.so.1     "$pkgdir"/usr/lib/libmfp.so

    _udevrules=(60_smfp_samsung 61_smfp_samsung)
    for i in ${_udevrules[@]}; do
        install -Dm644 "$srcdir"/"$i".rules "$pkgdir"/usr/lib/udev/rules.d/"$i".rules
    done

    # note: you may need to create a /etc/udev/rules.d/40-libsane.rules with the following: ATTRS{idVendor}=="AAAA", ATTRS{idProduct}=="BBBB", ENV{libsane_matched}="yes" with AAAA BBBB coming from sane-find-scanner or lsusb
    # see here: https://askubuntu.com/a/178855
}
