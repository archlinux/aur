# Contributor: holishing
pkgname=esunbank-webatm
pkgver=1.0.0.5
pkgrel=2
pkgdesc="WebATM service tool for Esun Bank at Taiwan"
arch=('x86_64')
url="https://www.esunbank.com.tw"
license=('custom')
makedepends=('libarchive' 'icoutils')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libappindicator-gtk2' 'libcanberra' 'nss' 'pcsclite')
## please use browser agent to download deb package:
## https://netbank.esunbank.com.tw/webatm/assets/ActiveX/EsunATM.deb
source=('EsunATM.deb')
sha512sums=('176fdf1d9b331deabe3037a4e2ba49783b08f4cb430c1bbab21755e4b4d17185407c487f53da1cfa2909187fec7ed723bdea20fc4397ff0ad33fcfd973d4d48b')

prepare() {
    bsdtar -xvf data.tar.xz -C "${srcdir}"
    # Fix directories structure differencies (We cannot do this because the path is fixed)
    cd "${srcdir}"
    mv usr/local/share/* usr/share; rm -rf usr/local
    icotool -x -o . usr/share/esunbank/esun.ico
}

package(){
    # Install Custom CA
    install -Dm644 $srcdir/usr/share/esunbank/AAA_Certificate_Authority.crt $pkgdir/usr/share/ca-certificates/trust-source/AAA_Certificate_Authority.crt

    # Main Program
    mv $srcdir/usr/share/esunbank/AAA_Certificate_Authority.crt $srcdir
    install -dm755 $pkgdir/opt/esunbank
    cp $srcdir/usr/share/esunbank/* $pkgdir/opt/esunbank/

    # SystemD user service
    install -Dm644 /dev/stdin $pkgdir/usr/lib/systemd/user/esunbank_webatm.service <<END
[Unit]
Description=WebATM service tool for Esun Bank at Taiwan

[Service]
Environment="LD_LIBRARY_PATH=/opt/esunbank/"
ExecStart=/opt/esunbank/EsunATM_Service

[Install]
WantedBy=default.target
END

    # Resemble restart.sh from upstream
    install -Dm755 /dev/stdin $pkgdir/usr/bin/esunbank_webatm_restart.sh <<END
#!/bin/sh
systemctl stop --user esunbank_webatm.service
sleep 2
systemctl start --user esunbank_webatm.service

exit 0
END

    # Icon
    install -Dm644 $srcdir/esun_1_128x128x32.png $pkgdir/usr/share/icons/hicolor/128x128/apps/esun.png
    # Application entry
    install -Dm644 /dev/stdin $pkgdir/usr/share/applications/esunatm.desktop <<END
[Desktop Entry]
Name=ESunATM
GenericName=File Synchronizer
Comment=ESunATM
Exec=esunbank_webatm_restart.sh
Terminal=false
Type=Application
Icon=esun
Name[en_US]=ESunATM
END
}
