# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: Ariel AxionL <axionl@aosc.io>

pkgname=electron-ssr
pkgver=0.2.5
pkgrel=3
pkgdesc='Shadowsocksr client using electron.'
arch=('x86_64')
conflicts=("electron-ssr-git")
provides=("electron-ssr")
url='https://github.com/erguotou520/electron-ssr'
license=('MIT')
depends=('gtk2' 'gconf' 'alsa-lib' 
         'libxss' 'nss' 'libxtst' 'electron')
makedepends=('yarn' 'npm' 'hicolor-icon-theme')
optdepends=('libsodium: sodium crypto support')
options=('!strip')

source=('https://raw.githubusercontent.com/erguotou520/electron-ssr/master/LICENSE'
        'icons.tar.gz'
        'electron-ssr.desktop'
        'build.patch'
        'argv.patch'
        'electron-ssr.sh')

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/erguotou520/electron-ssr/archive/v$pkgver.tar.gz")

sha256sums=('87561b47486c2485c76136172c87f0df16ee9dc4cb85be7d77ce274328f92735'
            '0d4372037676a0ee8f17f7cb875192923062a80ad61695dbe4548fde609d7698'
            'da2178b45bac74d2e0a2e5efc3598f9b2e5505baa97edd1153c5687e71b3642a'
            '387083e2a5be38d94b5f971a36f38a606260fd4c15d58524495b28481c45f746'
            '1dded3801546776041698f21fe2d239893eac0c4e4b0a99a93a613b3ff70de5f'
            '5dfe00e15a2dbf461d0b48107b4a994ef9444801e5f9b7083a4b020e634db67f')
sha256sums_x86_64=('2cc79109fa9dee400482ebc91a19ac1c96046d7788a40641ea4ee75fc3b04101')

prepare() {
	# Remove useless things
    dir=$srcdir/$pkgname-$pkgver/
    cd $dir
    patch -Np1 -i "$srcdir/build.patch"
    patch -Np1 -i "$srcdir/argv.patch"
}

build() {
    cd $srcdir/$pkgname-$pkgver

    # Build Package
    yarn
    npm run build
}

package() {
    # Install 
    cd $srcdir/$pkgname-$pkgver/dist/electron
    find * -type f -exec install -Dm644 {} "${pkgdir}/opt/electron-ssr/{}" \;
    install -Dm755 $srcdir/electron-ssr.sh $pkgdir/opt/$pkgname/electron-ssr
    mkdir -p $pkgdir/usr/bin
    ln -s /opt/$pkgname/electron-ssr $pkgdir/usr/bin/electron-ssr

    # Install modules
    cd $srcdir/$pkgname-$pkgver/node_modules
    find * -type f -exec install -Dm644 {} "${pkgdir}/opt/electron-ssr/node_modules/{}" \;
    cd "${pkgdir}/opt/electron-ssr/node_modules"
    rm -r ./electron

    # Install Other things
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

    cd $srcdir
    cd icons
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
        install -Dm644 $i.png $pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png
    done
}
