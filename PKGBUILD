# Maintainer: Franck Lominé <flomine@insa-rennes.fr>

pkgname=wapt-agent
pkgver=2.6.1.17834
pkgrel=1
pkgdesc="WAPT Agent"
arch=('x86_64')
url="https://www.wapt.fr/en/doc/"
license=('custom')
optdepends=('syslog-ng')
options=(!strip !debug !lto)
source=("https://wapt.tranquil.it/debian/wapt-2.6.1.17834/pool/main/t/tis-waptagent/tis-waptagent_2.6.1.17834-bd5dd3d4-amd64_amd64.deb"
        "LICENSE")
b2sums=('43f698157ea8e82fa0d43f55d9c58ed7fb18896f406010fc73025795c7b49f55278f93784bd502f39f24c6e3c05557769f2633ef155edd636c06c9643805af62'
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
