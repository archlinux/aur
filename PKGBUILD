# Maintainer: Matthieu Leboeuf <contact@matthieul.dev>

pkgname=wapt-agent
pkgver=2.5.4.15342
pkgrel=1
pkgdesc="WAPT Agent"
arch=('x86_64')
url="https://www.wapt.fr/en/doc/"
license=('custom')
optdepends=('syslog-ng')
source=("https://wapt.tranquil.it/debian/wapt-2.5/pool/main/t/tis-waptagent/tis-waptagent_2.5.4.15342-6215c9da-debian-12-amd64_amd64.deb"
        "LICENSE")
b2sums=('167048620d14da9288a4b5a6dad1ea6df12fa8547151381cd326904cd1753e7e83339d1f7cfb535272c25c3179e177f34f303f1615abd5c5248eb0a3280232f7'
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
