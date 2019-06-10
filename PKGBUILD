# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: Ariel AxionL <axionl@aosc.io>

pkgname=electron-ssr
pkgver=0.2.7
pkgrel=1
pkgdesc='Shadowsocksr client using electron.'
arch=('x86_64')
conflicts=("electron-ssr-git")
provides=("electron-ssr")
url='https://github.com/shadowsocksrr/electron-ssr'
license=('MIT')
depends=('electron')
makedepends=('yarn' 'hicolor-icon-theme')
optdepends=('libsodium: sodium crypto support')
options=('!strip')

source=("$pkgname-$pkgver.tar.gz::https://github.com/shadowsocksrr/electron-ssr/archive/v$pkgver.tar.gz"
        'https://raw.githubusercontent.com/shadowsocksrr/electron-ssr/master/LICENSE'
        'electron-ssr.desktop'
        'build.patch'
        'electron-ssr.sh')

sha256sums=('90e36f2116d283d20eae0047fc5b045c457c5c14ae844a2603bdcf70dc0fb1a3'
            '87561b47486c2485c76136172c87f0df16ee9dc4cb85be7d77ce274328f92735'
            'f96b27d2f826bf4e1c96f0154516c1e2cf07536f745128a9c2e5ec113cea6446'
            'e4dff411a6196ad0189a3102ac10aff024e189c350895c4a74c15588ea834723'
            'ae121e8a6995358b7e23881102e22b011a520f859b62675c129b5f99800bea0e')

prepare() {
	# Remove useless things
    dir=$srcdir/$pkgname-$pkgver/
    cd $dir
    patch -Np1 -i "$srcdir/build.patch"
}

build() {
    cd $srcdir/$pkgname-$pkgver

    # Build Package
    yarn
    yarn run build
}

package() {
    # Make dirs
    mkdir -p "$pkgdir/usr/share/applications"
    mkdir -p "$pkgdir/usr/share/electron-ssr"
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/icons/hicolor"

    # Install 
    cd "$srcdir/$pkgname-$pkgver/build/linux-unpacked/resources"
    install -Dm644 app.asar "$pkgdir/usr/share/electron-ssr/app.asar"
    install -Dm755 "$srcdir/electron-ssr.sh" "$pkgdir/usr/bin/electron-ssr"

    # Install Other things
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icons
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
        install -Dm644 "$srcdir/$pkgname-$pkgver/build/icons/$i.png" "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png"
    done
}
