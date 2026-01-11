# Maintainer: Thomas Wearmouth <tomwmth@pm.me>
pkgname='hytale-updater'
pkgver='1.0.0'
pkgrel=1
pkgdesc='A wrapper for the Hytale Launcher that allows Linux distribution friendly packaging'
arch=('x86_64')
url='https://github.com/tomwmth/hytale-updater'
license=('MIT')
depends=('webkit2gtk-4.1')
makedepends=('go')
source=(
    "hytale-updater-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
    'com.hypixel.HytaleLauncher.desktop'
    '32.png'
    '48.png'
    '64.png'
    '128.png'
    '256.png'
)
sha256sums=(
    '4d9c280a05858632e5d9a173010493cd641cfec0d059e36918db362ad60fec87'
    '188a111648e1ba9be9753c567c3f174751bc4d471de693618fc5f8decb8e31f7'
    '5c099afed8e08bf631bff8a518bf44ba5c81ba7fec36c8324ba2681c542e0335'
    'c0d61f398bc44aceb21a2c909e8d2fd268a62882eb46a870e6be7b8c528f8167'
    '1428fdcb1382a307e0f162de7a7bcd80a5aa1f95c10f41ae96b47c483824bc02'
    '1a08a95654015c021600df003ce9207bd197135e53c98265f0a01453e14de68a'
    '762d452d661cf4d13d0b4a4d8b8db4b803a3f5147e31b0a3023660bb0f58a83b'
)

_appid='com.hypixel.HytaleLauncher'

prepare() {
    export GOPATH="$srcdir"

    cd "$srcdir/$pkgname-$pkgver/src"

    go mod download -modcacherw
}

build() {
    cd "$srcdir/$pkgname-$pkgver"

    go build -C src -a -trimpath -buildmode=pie -mod=readonly -modcacherw \
        -ldflags="-linkmode external -extldflags \"$LDFLAGS\"" \
        -o $pkgname
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "src/$pkgname" "${pkgdir}/usr/bin/$pkgname"

    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm644 "$srcdir/$_appid.desktop" "$pkgdir/usr/share/applications/$_appid.desktop"

    for size in 32 48 64 128 256; do
        install -Dm644 "$srcdir/$size.png" "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/$_appid.png"
    done
}
