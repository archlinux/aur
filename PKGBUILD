# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=lenovo-wwan-unlock
pkgver=2.1.3
pkgrel=5
pkgdesc="FCC and DPR unlock for Lenovo PCs"
arch=(x86_64)
url=https://github.com/lenovo/lenovo-wwan-unlock
license=(LicenseRef-lenovo-software-code-license)
depends=(
    gcc-libs
    modemmanager
    pciutils
)
makedepends=(git)
source=($pkgname::git+https://github.com/lenovo/$pkgname#tag=v$pkgver)
install=$pkgname.install
b2sums=('cc7f08f44940d7e8fef0e87c6c613cf6b0bbc0c7bced4131c1469bbfb7128dd7f953ce8a2399b38c4d664b281ba6aa83cd565dbdd27d69112543751d10eb463e')

prepare() {
    # Comment all lines in drop-in systemd file so that it has no effect by default
    sed -i -e "s/^/#/" $pkgname/suspend-fix/apply-test-option.conf

}

package() {
    cd $pkgname

    # FCC unlock scripts for ModemManager
    tar -xzf fcc-unlock.d.tar.gz
    # Fibocom L860R+, Fibocom FM350 5G, Quectel RM520N-GL, Quectel EM160R-GL, Quectel EM061K, Quectel EM05-CN
    # These two files are now provided by upstream ModemManager
    #install -D -m755 fcc-unlock.d/14c3:4d75 "$pkgdir"/usr/share/ModemManager/fcc-unlock.available.d/14c3:4d75
    #install -D -m755 fcc-unlock.d/1eac:1007 "$pkgdir"/usr/share/ModemManager/fcc-unlock.available.d/1eac:1007
    install -D -m755 fcc-unlock.d/1eac:100d "$pkgdir"/usr/share/ModemManager/fcc-unlock.available.d/1eac:100d
    install -D -m755 fcc-unlock.d/2c7c:6008 "$pkgdir"/usr/share/ModemManager/fcc-unlock.available.d/2c7c:6008
    install -D -m755 fcc-unlock.d/8086:7560 "$pkgdir"/usr/share/ModemManager/fcc-unlock.available.d/8086:7560

    # SAR config files
    tar -xzf sar_config_files.tar.gz
    for file in sar_config_files/*.bin; do
        install -D -m644 $file "$pkgdir"/opt/fcc_lenovo/$file
    done

    # Libraries
    install -D -m755 libmodemauth.so "$pkgdir"/opt/fcc_lenovo/lib/libmodemauth.so
    install -D -m755 libconfigserviceR+.so "$pkgdir"/opt/fcc_lenovo/lib/libconfigserviceR+.so
    install -D -m755 libconfigservice350.so "$pkgdir"/opt/fcc_lenovo/lib/libconfigservice350.so
    install -D -m755 libmbimtools.so "$pkgdir"/opt/fcc_lenovo/lib/libmbimtools.so

    # Executables
    install -D -m755 DPR_Fcc_unlock_service "$pkgdir"/opt/fcc_lenovo/DPR_Fcc_unlock_service
    install -D -m755 configservice_lenovo "$pkgdir"/opt/fcc_lenovo/configservice_lenovo

    # Systemd service
    install -D -m644 lenovo-cfgservice.service "$pkgdir"/usr/lib/systemd/system/lenovo-cfgservice.service

    # Script to fix wake up during suspend
    # Affected devices: Fibocom L860-GL-16/FM350, Quectel EM160R-GL/RM520N-GL
    install -D -m644 suspend-fix/apply-test-option.conf "$pkgdir"/etc/systemd/system/ModemManager.service.d/apply-test-option.conf
    install -D -m755 suspend-fix/mm-wrapper.sh "$pkgdir"/opt/fcc_lenovo/suspend-fix/mm-wrapper.sh

    # Lenovo license and agreement
    install -D -m644 "Lenovo Software Code License Agreement for wwan.txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 "Lenovo Licence Agreement.pdf" "$pkgdir"/usr/share/licenses/$pkgname/Lenovo-Licence-Agreement.pdf
}
