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
}