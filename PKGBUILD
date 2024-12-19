# Maintainer: Zhanibek Adilbekov <zhanibek.adilbekov@pm.me>
# shellcheck disable=SC2034,SC2154,SC2164
pkgname=firefox-tridactyl-native
pkgver=1.24.2
_nativever=0.5.0
pkgrel=2
pkgdesc="Tridactyl native messaging host application for Firefox (native: $_nativever)"
arch=('x86_64')
url=https://github.com/tridactyl/tridactyl
license=('BSD-2-Clause')
depends=('glibc' 'gcc-libs')
makedepends=('nim' 'nimble' 'git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tridactyl/native_messenger/archive/refs/tags/$_nativever.tar.gz")
b2sums=('cc9a3b2b473f4a61f8b071a235bfc1fa7b48194c15e90b8c8fb6250f8a3b5559eeb73f312fdadf2c1cb2f64bfcd77b5201cce6329832e539742d7b059ade00c9')

build() {
    cd "$srcdir/native_messenger-$_nativever/"
    sed -i -e "s-REPLACE_ME_WITH_SED-/usr/lib/tridactyl/native_main-" ./tridactyl.json
    nimble build -d:release --opt:speed -d:lto -y
    chmod +x ./native_main
}

package() {
    cd "$srcdir/native_messenger-$_nativever/"
    install -D -m755 -t "$pkgdir/usr/lib/tridactyl" "./native_main"
    install -D -m644 -t "$pkgdir/usr/lib/mozilla/native-messaging-hosts" "./tridactyl.json"
    install -D -m644 -t "$pkgdir/usr/share/licenses/$pkgname" "./LICENSE"
}
