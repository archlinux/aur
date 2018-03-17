# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Lev Lybin <lev.lybin@gmail.com>

pkgname=burstcoin-wallet
_realname=burstcoin
pkgver=2.0.0
pkgrel=1
pkgdesc="The world's first HDD-mined cryptocurrency using an energy efficient and fair Proof-of-Capacity (PoC) consensus algorithm."
arch=('i686' 'x86_64')
url="https://github.com/PoC-Consortium/burstcoin"
license=('GPL3')
options=('!strip')
backup=(opt/burstcoin-wallet/conf/{logging-default.properties,nxt-default.properties,brs-default.properties})
depends=('java-runtime-common' 'java-runtime>=8')
source=(https://github.com/PoC-Consortium/burstcoin/releases/download/${pkgver}/burstcoin-${pkgver}.zip
burstcoin-wallet.service
)
md5sums=('64ec7530d98e8594c9622c2ec44f3bc2'
         'ffc739247043a0b48b51278666fb095a')

package() {
    install -dm755 $pkgdir/usr/lib/systemd/system
    install -dm755 $pkgdir/opt/$pkgname

    install -Dm644 burstcoin-wallet.service $pkgdir/usr/lib/systemd/system/burstcoin-wallet.service

    cd $srcdir

    cp -dr --no-preserve=ownership {burst_db,conf,html,burst.jar,Burst_Wallet.url,genscoop.cl} $pkgdir/opt/$pkgname

    install -Dm755 burst.sh $pkgdir/opt/$pkgname

    sed -i -e 's/DB.Url.*/DB.Url=jdbc:h2:\/opt\/burstcoin-wallet\/burst_db\/burst;DB_CLOSE_ON_EXIT=FALSE/g' $pkgdir/opt/$pkgname/conf/brs-default.properties
}
