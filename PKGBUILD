# Maintainer: Matthieu Leboeuf <contact@matthieul.dev>

pkgname=wapt-agent
pkgver=2.4.0.14143
pkgrel=1
pkgdesc="WAPT Agent"
arch=('x86_64')
url="https://www.wapt.fr/en/doc/"
license=('custom')
optdepends=('syslog-ng')
source=("https://wapt.tranquil.it/debian/wapt-2.4/pool/main/t/tis-waptagent/tis-waptagent_2.4.0.14143-9847ee8b-debian-12-amd64_amd64.deb"
        "LICENSE")
b2sums=('ecaae947051c9935d5bd1ead8081383e504dc000a6535a94581fd9cffeef8d6e301eb2efa4cd2b12d7b5d8dd32c60cb159de48c2f20b74a4979a227d76da0672'
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
