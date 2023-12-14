# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=firefox-tridactyl-native
pkgver=1.24.0
_nativever=0.4.1
pkgrel=1
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('x86_64')
url=https://github.com/tridactyl/tridactyl
license=('Apache')
makedepends=('nim' 'nimble' 'git' 'openssl-1.1')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tridactyl/native_messenger/archive/refs/tags/$_nativever.tar.gz")
b2sums=('39368cf6f7d762ed614415760443214fa93fc1d31d31327008cb2327abc558f2bd3128a86061f7945eeb9ab9c74b39f92af22250a1421b563ec16133be4b880a')

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
