# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=burstcoin-wallet
_realname=burstcoin
pkgver=2.0.2
pkgrel=1
pkgdesc="The world's first HDD-mined cryptocurrency using an energy efficient and fair Proof-of-Capacity (PoC) consensus algorithm."
arch=('i686' 'x86_64')
url="https://github.com/PoC-Consortium/burstcoin"
license=('GPL3')
options=('!strip')
backup=(opt/burstcoin-wallet/conf/{logging-default.properties,brs-default.properties})
depends=('java-runtime-common' 'java-runtime>=8')
source=(https://github.com/PoC-Consortium/burstcoin/releases/download/${pkgver}/burstcoin-${pkgver}.zip
burstcoin-wallet.service
)
sha256sums=('5a4d966d9938a3c163a79d893d93829b026a2f5d88f3a4c374b4a203a5569b80'
            '677aa600c97fcba5ec20f3e442f02acd920602e6bf08a8e536088fd6e2d15585')

package() {
    install -dm755 $pkgdir/usr/lib/systemd/system
    install -dm755 $pkgdir/opt/$pkgname

    install -Dm644 burstcoin-wallet.service $pkgdir/usr/lib/systemd/system/burstcoin-wallet.service

    cd $srcdir

    cp -dr --no-preserve=ownership {burst_db,conf,html,burst.jar,Burst_Wallet.url,genscoop.cl} $pkgdir/opt/$pkgname

    install -Dm755 burst.sh $pkgdir/opt/$pkgname

    sed -i -e 's/DB.Url.*/DB.Url=jdbc:h2:\/opt\/burstcoin-wallet\/burst_db\/burst;DB_CLOSE_ON_EXIT=FALSE/g' $pkgdir/opt/$pkgname/conf/brs-default.properties
}
