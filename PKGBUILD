# shellcheck shell=bash
# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Maintainer: Aviana Cruz <gwencroft@proton.me>

_electron_ver=18
pkgname=kuro
pkgver=8.1.6
pkgrel=3
pkgdesc='An elegant Microsoft ToDo desktop client for Linux'
arch=('any')
url='https://github.com/davidsmorais/kuro'
license=('MIT')
depends=("electron$_electron_ver")
makedepends=('nodejs' 'yarn')
provides=('ao' 'kuro')
conflicts=('ao' 'ao-git' 'kuro-appimage')
source=("$pkgname"
    "$pkgname.desktop"
    "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d206aef3ec01016487003ae53f59b675ffcaae41d6c27f87f5a92f18bd3b75ab'
            'a7602db570ab593499661d88feb6775c1a97458df2493ac1fe91f24b14911d2c'
            '81d7656c7ef6927597b2e87fe28df2dcb60d9b0c80fd729f8171f62419b92d4f')

build() {
    cd "$pkgname-$pkgver"

    local _arch
    case $CARCH in
    i686)
        _arch=ia32
        ;;
    x86_64)
        _arch=x64
        ;;
    *)
        _arch=$CARCH
        ;;
    esac

    yarn install
    export NODE_ENV=production
    yarn icons
    yarn run electron-builder --linux --"$_arch" --dir \
        -c.electronDist=/usr/lib/electron \
        -c.electronVersion="$_electron_ver" \
        --publish never
}

package() {
    cd "$pkgname-$pkgver"

    local _arch
    case $CARCH in
    i686)
        _arch=linux-ia32-unpacked
        ;;
    x86_64)
        _arch=linux-unpacked
        ;;
    *)
        _arch=linux-$CARCH-unpacked
        ;;
    esac
    install -Dm644 "dist/${_arch}/resources/app.asar" "$pkgdir/usr/lib/$pkgname/$pkgname.asar"

    for icon_size in 16 24 32 48 64 128 256 512; do
        install -Dm644 \
            "build/icons/png/${icon_size}x${icon_size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps/${pkgname}.png"
    done

    install -Dm644 -t "${pkgdir}/usr/share/applications" "../${pkgname}.desktop"
    install -Dm755 -t "${pkgdir}/usr/bin" "../$pkgname"
    install -Dm644 "license.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
