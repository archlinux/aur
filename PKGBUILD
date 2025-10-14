# Maintainer: Franck Lominé <flomine@insa-rennes.fr>

pkgname=wapt-agent
pkgver=2.6.1.17472
pkgrel=1
pkgdesc="WAPT Agent"
arch=('x86_64')
url="https://www.wapt.fr/en/doc/"
license=('custom')
optdepends=('syslog-ng')
source=("https://wapt.tranquil.it/debian/wapt-2.6/pool/main/t/tis-waptagent/tis-waptagent_2.6.1.17472-21f6d4b3-amd64_amd64.deb"
        "LICENSE")
b2sums=('53c8953532acc1c33f3badea8d06bdf00c1061f1e03625e829287ef738bb26e68080551e16a7402743f07d0998ceedfde5df3389612b948b375832684dfda008'
        'cd5269b8c3c36750904835e589d401e868c808df46ee265aa63b8720a09d066448f03b20c7e45949ae5ef59bf3ca90d73d15a0e18ce786f91ee51193e615c501')

package() {
    tar -xf data.tar.xz --no-same-owner -C "${pkgdir}"

    # postinstall of deb file (based on postinst file)
    echo Setting up log files
    mkdir -p $pkgdir/var/log
    touch $pkgdir/var/log/waptservice.log
    chown root:root $pkgdir/var/log/waptservice.log
    chmod 640 $pkgdir/var/log/waptservice.log

    echo Tightening up permissions
    [ ! -d $pkgdir/opt/wapt/private ] && mkdir $pkgdir/opt/wapt/private
    chown -R root:root $pkgdir/opt/wapt/private
    chmod -R 700 $pkgdir/opt/wapt/private

    [ -f $pkgdir/opt/wapt/wapt-get.ini ] && chown root:root $pkgdir/opt/wapt/wapt-get.ini && chown root:root $pkgdir/opt/wapt/wapt-get.ini

    [ ! -d $pkgdir/opt/wapt/ssl ] && mkdir $pkgdir/opt/wapt/ssl
    [ ! -d $pkgdir/opt/wapt/ssl/server ] && mkdir $pkgdir/opt/wapt/ssl/server
    [ ! -d $pkgdir/opt/wapt/db ] && mkdir $pkgdir/opt/wapt/db

    chown root:root $pkgdir/opt/wapt/db
    chmod 755 $pkgdir/opt/wapt/db

    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    echo
    echo -------------------------------------------------------------
    echo 'Enable the service, systemctl enable waptservice'
    echo -------------------------------------------------------------
    echo
}
