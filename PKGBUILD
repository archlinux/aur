# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: Ariel AxionL <axionl@aosc.io>

pkgname=electron-ssr-preview
_name=electron-ssr
pkgver=0.3.0a6
_pkgver=${pkgver/a/-alpha.}
pkgrel=1
pkgdesc='Shadowsocksr client using electron (Pre-release).'
arch=('x86_64' 'i686')
conflicts=("electron-ssr-git" "electron-ssr")
provides=("electron-ssr")
url='https://github.com/shadowsocksrr/electron-ssr'
license=('MIT')
depends=('electron')
makedepends=('yarn' 'hicolor-icon-theme')
optdepends=('libsodium: sodium crypto support')
options=('!strip')

source=("$pkgname-$pkgver.tar.gz::https://github.com/shadowsocksrr/electron-ssr/archive/$_pkgver.tar.gz"
        'https://raw.githubusercontent.com/shadowsocksrr/electron-ssr/master/LICENSE'
        'electron-ssr.desktop'
        'electron-ssr.sh')

sha256sums=('c6a022e84e2678992b968dc02dd3d54de8d471a56588a37d105aa1b44ccdc9a2'
            '87561b47486c2485c76136172c87f0df16ee9dc4cb85be7d77ce274328f92735'
            'f96b27d2f826bf4e1c96f0154516c1e2cf07536f745128a9c2e5ec113cea6446'
            'ae121e8a6995358b7e23881102e22b011a520f859b62675c129b5f99800bea0e')

build() {
    cd "$srcdir/$_name-$_pkgver"

    # Build Package
    yarn
    yarn fetch-dep
    yarn electron:build --dir
}

package() {
    # Make dirs
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/electron-ssr"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/icons/hicolor"

    # Install
    cd "$srcdir/$_name-$_pkgver/dist_electron/linux-unpacked/resources"
    install -Dm644 app.asar "$pkgdir/usr/share/electron-ssr/app.asar"
    install -Dm755 "$srcdir/electron-ssr.sh" "$pkgdir/usr/bin/electron-ssr"

    # Install Other things
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_name/LICENSE"
    install -Dm644 "$srcdir/$_name.desktop" "$pkgdir/usr/share/applications/$_name.desktop"

    # Install icons
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
        install -Dm644 "$srcdir/$_name-$_pkgver/build/icons/$i.png" "$pkgdir/usr/share/icons/hicolor/$i/apps/$_name.png"
    done
}
