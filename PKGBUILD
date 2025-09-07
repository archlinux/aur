# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
pkgname=lenovo-wwan-unlock
pkgver=3.1.0
pkgrel=2
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
b2sums=('202570508860c7a0cf118a0e30e45deb9f371608f2d37fd4168dd2cc023cc3a230eb45450b7286fd42739f64ae3c59e6d62aaa7a050f5f0244f2f7644d0ee05b')

package() {
    cd $pkgname

    # FCC unlock scripts for ModemManager
    tar -xzf fcc-unlock.d.tar.gz

    # Fibocom L860R+, Fibocom FM350 5G, Quectel RM520N-GL, Quectel EM160R-GL, Quectel EM061K, Quectel EM05-CN
    install -D -m755 fcc-unlock.d/14c3:4d75 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/14c3:4d75
    install -D -m755 fcc-unlock.d/1eac:1007 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/1eac:1007
    install -D -m755 fcc-unlock.d/1eac:100d "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/1eac:100d
    install -D -m755 fcc-unlock.d/2c7c:6008 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/2c7c:6008
    install -D -m755 fcc-unlock.d/8086:7560 "$pkgdir"/usr/lib/ModemManager/fcc-unlock.d/8086:7560

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

    # Lenovo license and agreement
    install -D -m644 "Lenovo Software Code License Agreement for wwan.txt" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -D -m644 "Lenovo Licence Agreement.pdf" "$pkgdir"/usr/share/licenses/$pkgname/Lenovo-Licence-Agreement.pdf
}
