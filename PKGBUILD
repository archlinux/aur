# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=lenovo-wwan-unlock
pkgver=4.0.0
pkgrel=3
pkgdesc="FCC and DPR unlock for Lenovo PCs"
arch=(x86_64)
url=https://github.com/lenovo/lenovo-wwan-unlock
license=(LicenseRef-lenovo-software-code-license)
depends=(
    gcc-libs
    libxml2-legacy
    modemmanager
    pciutils
)
makedepends=(git)
optdepends=(
    "android-tools: fastboot required for RW101R Modem"
)
source=(
    $pkgname::git+https://github.com/lenovo/$pkgname#tag=v$pkgver
    fix_suspend.conf
)
install=$pkgname.install
b2sums=('de3e409502a4f8859b6d6da0405b15829608bc018f8cec947751d48c60e518f22ec21d762bd4f08a14cd3ac6952d2ef683e2ea4108e1a19143ecc28eac6323d1'
        '977e608ef3a415d68e00dc4df8a39cf3e0d366140f8a2a14d5eeee322a7b62e0d6485a2f1916e2f9507662c2cb17e68fa50083188427194a2a40069ac9d4c71c')

package() {
    cd $pkgname

    # FCC unlock scripts for ModemManager
    tar -xzf fcc-unlock.d.tar.gz

    # Supported WWAN modules:
    # -> Fibocom: L860R+, FM350 5G
    # -> Quectel: RM520N-GL, EM160R-GL, EM061K, EM05-CN
    # -> Rolling Wireless: RW350, RW101R-GL
    # -> Foxconn: SDX61
    install -D -m755 fcc-unlock.d/1eac:100d "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/1eac:100d
    # 1eac:1007 included in modemmanager
    install -D -m755 fcc-unlock.d/2c7c:6008 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/2c7c:6008
    install -D -m755 fcc-unlock.d/14c3:4d75 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/14c3:4d75
    install -D -m755 fcc-unlock.d/17cb:0308 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/17cb:0308
    install -D -m755 fcc-unlock.d/33f8:01a4 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/33f8:01a4
    install -D -m755 fcc-unlock.d/33f8:01a8 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/33f8:01a8
    install -D -m755 fcc-unlock.d/33f8:01a9 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/33f8:01a9
    install -D -m755 fcc-unlock.d/33f8:0301 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/33f8:0301
    install -D -m755 fcc-unlock.d/33f8:0302 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/33f8:0302
    install -D -m755 fcc-unlock.d/8086:7560 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/8086:7560

    mkdir -p "$pkgdir"/opt/fcc_lenovo/

    # OTA files
    tar -zxf DEV_OTA_PACKAGE.tar.gz
    for dir in DEV_OTA_PACKAGE/*/; do
        install -D -m644 $dir/devicepack.ubi "$pkgdir"/opt/fcc_lenovo/$dir/devicepack.ubi
    done
    install -D -m644 DEV_OTA_PACKAGE/WwanDeviceIdImageMappingTable.xml \
        "$pkgdir"/opt/fcc_lenovo/DEV_OTA_PACKAGE/WwanDeviceIdImageMappingTable.xml

    # SAR config files
    tar -xzf sar_config_files.tar.gz
    for file in sar_config_files/*.bin; do
        install -D -m644 $file "$pkgdir"/opt/fcc_lenovo/$file
    done
    for file in sar_config_files/cs25/*.bin; do
        install -D -m644 $file "$pkgdir"/opt/fcc_lenovo/$file
    done
    for file in sar_config_files/cs26/fxn/*.bin; do
        install -D -m644 $file "$pkgdir"/opt/fcc_lenovo/$file
    done

    # Libraries
    install -D -m755 libmodemauth.so "$pkgdir"/opt/fcc_lenovo/lib/libmodemauth.so
    install -D -m755 libmodemauth.so.1.1 "$pkgdir"/opt/fcc_lenovo/lib/libmodemauth.so.1.1
    install -D -m755 libconfigserviceR+.so "$pkgdir"/opt/fcc_lenovo/lib/libconfigserviceR+.so
    install -D -m755 libconfigservice350.so "$pkgdir"/opt/fcc_lenovo/lib/libconfigservice350.so
    install -D -m755 libconfigservice350.so.1.2 "$pkgdir"/opt/fcc_lenovo/lib/libconfigservice350.so.1.2
    install -D -m755 libconfigservice101.so.1.2 "$pkgdir"/opt/fcc_lenovo/lib/libconfigservice101.so.1.2
    install -D -m755 libmbimtools.so "$pkgdir"/opt/fcc_lenovo/lib/libmbimtools.so
    install -D -m755 libfiisdk.so.2.2.2 "$pkgdir"/opt/fcc_lenovo/lib/libfiisdk.so.2.2.2
    install -D -m755 libmodemauthRW101.so.1.1 "$pkgdir"/opt/fcc_lenovo/lib/libmodemauthRW101.so.1.1

    # Executables
    install -D -m755 DPR_Fcc_unlock_service "$pkgdir"/opt/fcc_lenovo/DPR_Fcc_unlock_service
    install -D -m755 configservice_lenovo "$pkgdir"/opt/fcc_lenovo/configservice_lenovo

    # Systemd service
    install -D -m644 lenovo-cfgservice.service "$pkgdir"/usr/lib/systemd/system/lenovo-cfgservice.service

    # Drop-in override for Fibocom L860-GL-16/FM350, Quectel EM160R-GL/RM520N-GL and Foxconn SDX61 WWANs
    # Instead of modifying ModemManager.service as upstream does in wwan_issue_fix.sh
    install -D -m644 "$srcdir"/fix_suspend.conf "$pkgdir"/usr/lib/systemd/system/ModemManager.service.d/fix_suspend.conf

    # Lenovo license and agreement
    install -D -m644 "Lenovo Software Code License Agreement for wwan.txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 "Lenovo Licence Agreement.pdf" "$pkgdir"/usr/share/licenses/$pkgname/Lenovo-Licence-Agreement.pdf
}
