# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=firefox-tridactyl-native
pkgver=1.23.0
_nativever=0.3.6
pkgrel=1
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('x86_64')
url=https://github.com/tridactyl/tridactyl
license=('Apache')
makedepends=('nim' 'nimble' 'git' 'openssl-1.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tridactyl/native_messenger/archive/refs/tags/$_nativever.tar.gz")
b2sums=('f1114adf7f6b758273c045ff88d5c22bef98a10d4d1e71ffd66f40924a5f901e081652c72649cc87aeab55574c9e986031c68e80fa2c1b5d6d851196feec90f9')

build() {
    cd "$srcdir/native_messenger-$_nativever/"
    sed -i -e "s-REPLACE_ME_WITH_SED-/usr/lib/tridactyl/native_main-" ./tridactyl.json
    nimble build -d:release -d:danger --opt:speed -Y
    chmod +x ./native_main
}

package() {
    cd "$srcdir/native_messenger-$_nativever/"
    install -D -m755 -t "$pkgdir/usr/lib/tridactyl" "./native_main"
    install -D -m644 -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts" "./tridactyl.json"
}
