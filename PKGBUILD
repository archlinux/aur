# Maintainer: Maxim Baz <$pkgname at maximbaz dot com>

pkgname=yubikey-touch-detector
pkgver=1.1.0
pkgrel=3
pkgdesc='A tool that can detect when your YubiKey is waiting for a touch'
arch=('x86_64')
url='https://github.com/maximbaz/yubikey-touch-detector'
license=('MIT')
makedepends=('go-pie')
optdepends=('gnupg: for GPG'
            'openssh: for SSH'
            'pam_u2f: for U2F')
install='yubikey-touch-detector.install'
source=("$pkgname-$pkgver.tar.gz::https://github.com/maximbaz/yubikey-touch-detector/releases/download/$pkgver/$pkgname-src.tar.gz"
        "$pkgname-$pkgver.tar.gz.sig::https://github.com/maximbaz/yubikey-touch-detector/releases/download/$pkgver/$pkgname-src.tar.gz.sig")
sha256sums=('31f47ebc1ae1428d746fc6ca3489ce9424fca8e4bf8a05d36f5496d30225ef7c'
            'SKIP')
validpgpkeys=('EB4F9E5A60D32232BB52150C12C87A28FEAC6B20')

build() {
    _GOPATH="$(pwd)/.go"

    _go_pkgname='github.com/maximbaz/yubikey-touch-detector'
    _go_pkgpath="$_GOPATH/src/$_go_pkgname"
    mkdir -p "$(dirname $_go_pkgpath)"
    ln -sf "$srcdir/$pkgname" "$_go_pkgpath"

    cd "$_go_pkgpath"
    GOPATH="$_GOPATH" make build
}

package() {
    cd "$pkgname"
    install -Dm755 -t "$pkgdir/usr/bin" "$pkgname"
    install -Dm644 -t "$pkgdir/usr/lib/systemd/user" "$pkgname.service"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

# vim:set ts=4 sw=4 et:
