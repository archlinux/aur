# Maintainer: Nebulosa  <nebulosa2007-at-yandex-dot-ru>
pkgname=wireguard-ui
pkgver=0.5.2
pkgrel=1
pkgdesc="A web user interface to manage your WireGuard setup."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/ngoduykhanh/$pkgname"
license=('MIT')
makedepends=('yarn' 'npm' 'go')
depends=('wireguard-tools')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        $pkgname.service
        99-wg.conf
        wgiptables.sh
        wg-reload.path
        wg-reload.service)

sha256sums=('50a9491b5d83331b306f8cf8b6a3856f27fa00c0040ddb84ea1f6a23436bca1c'
            'c60cbe2d47c616a2f9984c6c57ef60e810c7e57ca5054a318b3da8770bf03b76'
            'cf5bdce2ce87b5054042a70d8630f40a0f991c64c42786824f660245b943d2be'
            'bc8b1cee00a541eab44dab5bd23afddb99d9c667a5d4d083d7bf9575b321052c'
            '4b63dee5d287bb16a8e1a588ba24ccaeb91a4e0d2993bfeb9a1fb423bf08432d'
            '44d74ce9057193a34e2c6afc4996188bc9b26594cdb691f96076d1986b615e4f')

conflicts=($pkgname)
provides=($pkgname)
install=$pkgname.install

build() {
        export GOPATH=$srcdir/$pkgname"-"$pkgver/gopath
        export CGO_CPPFLAGS="${CPPFLAGS}"
        export CGO_CFLAGS="${CFLAGS}"
        export CGO_CXXFLAGS="${CXXFLAGS}"
        export CGO_LDFLAGS="${LDFLAGS}"
        export CGO_ENABLED=1

        cd $pkgname"-"$pkgver
        ./prepare_assets.sh
        go build -o $pkgname
}

package() {
        install -d $pkgdir/{opt/$pkgname,usr/lib/systemd/system,etc/sysctl.d}
        install -Dm755 $pkgname-$pkgver/$pkgname $pkgdir/opt/$pkgname/$pkgname
        install -Dm644 $srcdir/$pkgname.service ${pkgdir}/usr/lib/systemd/system/$pkgname.service
        install -Dm644 $srcdir/99-wg.conf ${pkgdir}/etc/sysctl.d/99-wg.conf
        install -Dm755 $srcdir/wgiptables.sh ${pkgdir}/opt/$pkgname/wgiptables
        install -Dm644 $srcdir/wg-reload.path ${pkgdir}/usr/lib/systemd/system/wg-reload.path
        install -Dm644 $srcdir/wg-reload.service ${pkgdir}/usr/lib/systemd/system/wg-reload.service
}
