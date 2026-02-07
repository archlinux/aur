# Maintainer: Parcoil <parcoil@parcoil.com>
pkgname=dotline
pkgver=0.3.1
pkgrel=1
pkgdesc="A modern crosshair overlay"
arch=('x86_64')
url="https://github.com/Parcoil/dotline"
license=('MIT')
depends=('nodejs')
makedepends=('pnpm')
conflicts=('dotline-bin' 'dotline-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Parcoil/dotline/archive/refs/tags/v$pkgver.tar.gz"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    cd "$pkgname-$pkgver"
    echo "audit=false" > .npmrc
    echo "fund=false" >> .npmrc
    echo "update-notifier=false" >> .npmrc
}

build() {
    cd "$pkgname-$pkgver"
    pnpm install --frozen-lockfile
    pnpm run build
    pnpm exec electron-builder --linux --dir
}

package() {
    cd "$srcdir"
    install -d "$pkgdir/opt/dotline"
    cp -r "$pkgname-$pkgver/dist/linux-unpacked/"* "$pkgdir/opt/dotline/"
    install -Dm755 "$pkgname.sh" "$pkgdir/usr/bin/dotline"
    install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/dotline.desktop"
    install -Dm644 "$pkgname-$pkgver/resources/dotline.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/dotline.png"
}sha256sums=('750dec0a95c1dae3c3dbd84a88be2d4766529ae92865e6095d50b495c3fe10f5'
            'baead61071042f16e2492e6799b94a524516d4f712123628a738594edbc62fa8'
            '0adb7a3b59f1ca73beff123db26b1a0cbd2771b6ef68d106b591d69a641a6bbc')
