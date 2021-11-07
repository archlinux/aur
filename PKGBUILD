# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
pkgname=firefox-tridactyl-native
pkgver=1.21.1
_nativever=0.3.4
pkgrel=6
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('x86_64')
url=https://github.com/tridactyl/tridactyl
license=('Apache')
makedepends=('nim' 'nimble' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tridactyl/native_messenger/archive/refs/tags/$_nativever.tar.gz")
b2sums=('92caafbf4abfc73ea3b6423905ea56425c71cd2d2ecc29cf59b7405fe4a44ea43dddf31d97e6ed7ff95700341fec24a5ff516c167b7df8905d0dae162a55efc9')

build() {
    cd "$srcdir"/native_messenger-*/
    sed -i -e "s-REPLACE_ME_WITH_SED-/usr/lib/tridactyl/native_main-" ./tridactyl.json
    nimble build -d:release -d:danger --opt:speed -Y
    chmod +x ./native_main
}

package() {
    cd "$srcdir"/native_messenger-*/
    install -D -m755 -t "$pkgdir/usr/lib/tridactyl" "./native_main"
    install -D -m644 -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts" "./tridactyl.json"
}
