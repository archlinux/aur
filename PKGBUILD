# Maintainer: Nisaba Xaekai <archlinux@pink.horse>
#
# The only source for the server binary is steamcmd. This means no matter what the package version
# says, it will always be the latest version because that's all steamcmd allows for retrieval of.
#
# pkgver came from most recent changenumber from https://steamdb.info/app/2394010/charts/

pkgname=palworld-server
pkgver=22157978
pkgrel=1
pkgdesc="Dedicated server for the Palworld PC game"
arch=('x86_64')
url='https://www.pocketpair.jp/palworld'
license=('custom:PocketPairLicense')
depends=("zlib" "gcc-libs" "lib32-glibc")
makedepends=("steamcmd")
backup=("etc/palworld/server.conf" "etc/ufw/applications.d/ufw-palworld")
source=('palworld-server.service'
        'palworld.sysusers'
        'palworld.tmpfiles'
        'server.conf'
        'ufw-palworld')
sha512sums=('881ce5e7876d649dca2adca65d3e69eac279672e468fc51acc6a56a9e4ca835f94002c9e7816b5dd004af5d5561f77ff2af1dea8169f722ec17d4fe092e21948'
            '2aa98d49fd5ed2683ab3f1aeac7dc3cc643ac7fd8b34bdcb84c6e5046f6dc92a15cef99ecb917fdb894107b5ad73d0148ec1e23d5365a9941140abc15c031022'
            '0fd7795b80a5a9f48abc6f9e6915bf0f8ecf1287154cb4e218ae662c0b5af3335e009ee59b7e9664ae5b20e6363c65f76f52a1625c1998b881187170870d71f1'
            '3e0e758d8506511fb461b7d841e7724d3262dbb4e79b8b4ead786071d46764cd421d7c80416a3a664160bffd9598e6b1b80e878d75f124dc81a911ed64d3af5a'
            'e31c49d353b188377e29aaffac4dea8bb16c18fc5fe15e74b7438968e7ed87345340896b285ff40a53801a4ad7eb0a777d2e53ead0303ab7eaadfa332c76dc33')

prepare() {
    steamcmd +force_install_dir "$srcdir/$pkgname" +login anonymous +app_update 2394010 validate +quit
}

package() {
    cd $srcdir
    mkdir -p "$pkgdir/opt"
    cp -r $pkgname "$pkgdir/opt/"

    install -D -m 0644 palworld-server.service "$pkgdir/usr/lib/systemd/system/palworld-server.service"
    install -D -m 0644 server.conf "$pkgdir/etc/palworld/server.conf"
    install -D -m 0644 ufw-palworld "$pkgdir/etc/ufw/applications.d/ufw-palworld"
    install -D -m 0644 palworld.sysusers "$pkgdir/usr/lib/sysusers.d/palworld.conf"
    install -D -m 0644 palworld.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/palworld.conf"
}
