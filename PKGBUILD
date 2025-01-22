# Maintainer: Franck Lominé <flomine@insa-rennes.fr>

pkgname=wapt-agent
pkgver=2.6.0.16795
pkgrel=1
pkgdesc="WAPT Agent"
arch=('x86_64')
url="https://www.wapt.fr/en/doc/"
license=('custom')
optdepends=('syslog-ng')
source=("https://wapt.tranquil.it/debian/wapt-2.6/pool/main/t/tis-waptagent/tis-waptagent_2.6.0.16795-5c1227ae-amd64_amd64.deb"
        "LICENSE")
b2sums=('836a0594f1ad32276ba90a6c1983628daaf02a36e9f974382ca0c29a1d64932bfe62677de3e4006845200111318fe156a1cb25b90d3d249b5c03d4e19be08483'
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
