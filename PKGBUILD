# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgbase='samsung-unified-driver'
pkgname=(
    'samsung-unified-driver-common'
    'samsung-unified-driver-printer'
    'samsung-unified-driver-scanner'
    'samsung-unified-driver'
)
pkgver=1.00.37
pkgrel=3

pkgdesc='Unified Linux Driver for Samsung printers and scanners.'
arch=('i686' 'x86_64')
url="http://www.samsung.com"
license=('custom:samsung')
depends=('libxml2' 'libusb-compat' 'cups' 'sane')

options=(!strip)
source=(
    "http://downloadcenter.samsung.com/content/DR/201512/20151210091120064/uld_v${pkgver}_00.99.tar.gz"
    "xerox_mfp-smfp.conf")
sha512sums=('96feb7f7464db616f400f34a61bf6facafe51da9a48e19d6c4e702ea2377e86f5a5f93d085c50c8220396249febbf8e604a9fe27c25324f36ad0e58552af21fb'
            '325d2e3e42bf74663ba0ac3aa0fc3ee70ef5a5197d03c069fac6bc0f8da0d9e12d50e4b59feacef3000eff5a85d3db7f66834809013b18b31532cfea252460ef')

_arch=${CARCH/i686/i386}

package_samsung-unified-driver()
{
    depends=('samsung-unified-driver-printer'
             'samsung-unified-driver-scanner')
}

package_samsung-unified-driver-common()
{
    mkdir -p "$pkgdir"/usr/share/licenses/$pkgbase
    cp "$srcdir"/uld/noarch/license/eula.txt "$pkgdir"/usr/share/licenses/$pkgbase/LICENSE
    cp "$srcdir"/uld/noarch/license/eula-fr.txt "$pkgdir"/usr/share/licenses/$pkgbase
}

package_samsung-unified-driver-printer()
{
    depends=('samsung-unified-driver-common' 'cups' 'ghostscript')

    mkdir -p "$pkgdir"/usr/lib
    cp "$srcdir"/uld/$_arch/libscmssc.so "$pkgdir"/usr/lib

    mkdir -p "$pkgdir"/usr/lib/cups/backend
    cp "$srcdir"/uld/$_arch/smfpnetdiscovery "$pkgdir"/usr/lib/cups/backend

    mkdir -p "$pkgdir"/usr/lib/cups/filter
    cp "$srcdir"/uld/$_arch/pstosecps "$pkgdir"/usr/lib/cups/filter
    cp "$srcdir"/uld/$_arch/rastertospl "$pkgdir"/usr/lib/cups/filter

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

        mkdir -p "$pkgdir"/opt/samsung/scanner/share
        cp "$OEM_FILE" "$pkgdir"/opt/samsung/scanner/share
    )
}
