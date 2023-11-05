# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgbase='samsung-unified-driver'
pkgname=(
    'samsung-unified-driver-common'
    'samsung-unified-driver-printer'
    'samsung-unified-driver-scanner'
    'samsung-unified-driver'
)
pkgver=1.00.39
pkgrel=7

pkgdesc='Samsung Unified Linux Driver for printers and scanners.'
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
options=(!strip)
source=(
    "http://downloadcenter.samsung.com/content/DR/201704/20170407143829533/uld_V${pkgver}_01.17.tar.gz"
    "xerox_mfp-smfp.conf")
sha512sums=('fccda77af20b31c9b46117b013d0c40333adc87679057c2b1e513d9bae97fc7267eca74030bc039feec50edee8e4cdfebe8761c77d653646f7ea4ac102c2643f'
            '325d2e3e42bf74663ba0ac3aa0fc3ee70ef5a5197d03c069fac6bc0f8da0d9e12d50e4b59feacef3000eff5a85d3db7f66834809013b18b31532cfea252460ef')

_arch=${CARCH/i686/i386}

prepare(){
    chmod -R u+w "$srcdir"/*
}

package_samsung-unified-driver()
{
    depends=('samsung-unified-driver-printer'
             'samsung-unified-driver-scanner')
}

package_samsung-unified-driver-common()
{
    pkgdesc='Samsung Unified Linux Driver (common files)'
    mkdir -p "$pkgdir"/usr/share/licenses/$pkgbase
    cp "$srcdir"/uld/noarch/license/eula.txt "$pkgdir"/usr/share/licenses/$pkgbase/LICENSE
    cp "$srcdir"/uld/noarch/license/eula-fr.txt "$pkgdir"/usr/share/licenses/$pkgbase
}

package_samsung-unified-driver-printer()
{
    pkgdesc='Samsung Unified Linux Driver for printers.'
    depends=('samsung-unified-driver-common' 'cups' 'ghostscript')

    mkdir -p "$pkgdir"/usr/lib
    cp "$srcdir"/uld/$_arch/libscmssc.so "$pkgdir"/usr/lib

    mkdir -p "$pkgdir"/usr/lib/cups/backend
    cp "$srcdir"/uld/$_arch/smfpnetdiscovery "$pkgdir"/usr/lib/cups/backend

    mkdir -p "$pkgdir"/usr/lib/cups/filter
    cp "$srcdir"/uld/$_arch/pstosecps "$pkgdir"/usr/lib/cups/filter
    cp "$srcdir"/uld/$_arch/rastertospl "$pkgdir"/usr/lib/cups/filter
    ln -s rastertospl "$pkgdir"/usr/lib/cups/filter/rastertosplc

    mkdir -p "$pkgdir"/usr/share/ppd/suld
    for ppd in "$srcdir"/uld/noarch/share/ppd/*.ppd; do
        gzip < "$ppd" > "$pkgdir"/usr/share/ppd/suld/"${ppd##*/}".gz
    done

    mkdir -p "$pkgdir"/usr/share/ppd/suld/cms
    for cts in "$srcdir"/uld/noarch/share/ppd/cms/*.cts; do
        cp "$cts" "$pkgdir"/usr/share/ppd/suld/cms
    done
}

package_samsung-unified-driver-scanner()
{
    pkgdesc='Samsung Unified Linux Driver for scanners.'
    depends=('samsung-unified-driver-common' 'libxml2' 'libusb-compat' 'sane')

    mkdir -p "$pkgdir"/usr/share
    cp -r "$srcdir"/uld/noarch/share/locale "$pkgdir"/usr/share
    rm -f "$pkgdir"/usr/share/locale/fr/LC_MESSAGES/install.mo

    mkdir -p "$pkgdir"/etc/sane.d
    cp "$srcdir"/uld/noarch/etc/smfp.conf "$pkgdir"/etc/sane.d
    cp "$srcdir"/xerox_mfp-smfp.conf "$pkgdir"/etc/sane.d

    mkdir -p "$pkgdir"/etc/sane.d/dll.d
    echo smfp > "$pkgdir"/etc/sane.d/dll.d/smfp-scanner
    echo xerox_mfp-smfp > "$pkgdir"/etc/sane.d/dll.d/smfp-scanner-fix

    mkdir -p "$pkgdir"/usr/lib/sane
    cp "$srcdir"/uld/$_arch/libsane-smfp.so.1.0.1 "$pkgdir"/usr/lib/sane
    ln -s libsane-smfp.so.1.0.1 "$pkgdir"/usr/lib/sane/libsane-smfp.so.1
    ln -s libsane-smfp.so.1 "$pkgdir"/usr/lib/sane/libsane-smfp.so

    mkdir -p "$pkgdir"/usr/lib/udev/rules.d
    (
        OEM_FILE="$srcdir"/uld/noarch/oem.conf
        INSTALL_LOG_FILE=/dev/null
        source "$srcdir"/uld/noarch/scripting_utils
        source "$srcdir"/uld/noarch/package_utils
        source "$srcdir"/uld/noarch/scanner-script.pkg
        fill_full_template "$srcdir"/uld/noarch/etc/smfp.rules.in "$pkgdir"/usr/lib/udev/rules.d/60_smfp_samsung.rules
        chmod 644 "$pkgdir"/usr/lib/udev/rules.d/60_smfp_samsung.rules

        mkdir -p "$pkgdir"/opt/samsung/scanner/share
        cp "$OEM_FILE" "$pkgdir"/opt/samsung/scanner/share
    )
}
