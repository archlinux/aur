# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=samsung-unified-driver
pkgver=1.00.36
pkgrel=1

pkgdesc="Unified Linux Driver for Samsung printers and scanners."
arch=(i686 x86_64)
url="http://www.samsung.com"
license=('custom:samsung')
depends=('libxml2' 'libusb-compat' 'cups' 'sane')

options=(!strip)
source=(
    "http://downloadcenter.samsung.com/content/DR/201510/20151028111741150/uld_v${pkgver}_00.91.tar.gz"
    "xerox_mfp-smfp.conf")
sha512sums=('3f824b1af9dd4dd200a289832289ba44841fc85586322126ff44986d1e44a53fab1f9fba247f02eda784773c44801950d39203ee3e083d4fb6a03526a32d76fc'
            '325d2e3e42bf74663ba0ac3aa0fc3ee70ef5a5197d03c069fac6bc0f8da0d9e12d50e4b59feacef3000eff5a85d3db7f66834809013b18b31532cfea252460ef')

package() {
    if [ "$arch" = "i686" ]; then
        arch=i386
    else
        arch=$CARCH
    fi

    mkdir -p "$pkgdir"/etc/sane.d
    cp "$srcdir"/uld/noarch/etc/smfp.conf "$pkgdir"/etc/sane.d
    cp "$srcdir"/xerox_mfp-smfp.conf "$pkgdir"/etc/sane.d

    mkdir -p "$pkgdir"/etc/sane.d/dll.d
    echo smfp > "$pkgdir"/etc/sane.d/dll.d/smfp-scanner
    echo xerox_mfp-smfp > "$pkgdir"/etc/sane.d/dll.d/smfp-scanner-fix

    mkdir -p "$pkgdir"/usr/lib
    cp "$srcdir"/uld/$arch/libscmssc.so "$pkgdir"/usr/lib

    mkdir -p "$pkgdir"/usr/lib/cups/backend
    cp "$srcdir"/uld/$arch/smfpnetdiscovery "$pkgdir"/usr/lib/cups/backend

    mkdir -p "$pkgdir"/usr/lib/cups/filter
    cp "$srcdir"/uld/$arch/pstosecps "$pkgdir"/usr/lib/cups/filter
    cp "$srcdir"/uld/$arch/rastertospl "$pkgdir"/usr/lib/cups/filter

    mkdir -p "$pkgdir"/usr/lib/sane
    cp "$srcdir"/uld/$arch/libsane-smfp.so.1.0.1 "$pkgdir"/usr/lib/sane
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
    )

    mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
    cp "$srcdir"/uld/noarch/license/eula.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    cp "$srcdir"/uld/noarch/license/eula-fr.txt "$pkgdir"/usr/share/licenses/$pkgname

    cp -r "$srcdir"/uld/noarch/share/locale "$pkgdir"/usr/share
    rm -f "$pkgdir"/usr/share/locale/fr/LC_MESSAGES/install.mo

    mkdir -p "$pkgdir"/usr/share/ppd/suld
    for ppd in "$srcdir"/uld/noarch/share/ppd/*.ppd; do
        gzip < "$ppd" > "$pkgdir"/usr/share/ppd/suld/"${ppd##*/}".gz
    done

    mkdir -p "$pkgdir"/usr/share/ppd/suld/cms
    for cts in "$srcdir"/uld/noarch/share/ppd/cms/*.cts; do
        cp "$cts" "$pkgdir"/usr/share/ppd/suld/cms
    done
}
