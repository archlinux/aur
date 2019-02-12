# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: Ariel AxionL <axionl@aosc.io>

pkgname=electron-ssr
pkgver=0.2.6
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
        'electron-ssr.desktop'
        'build.patch'
        'argv.patch'
        'path.patch'
        'electron-ssr.sh')

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/erguotou520/electron-ssr/archive/v$pkgver.tar.gz")

sha256sums=('87561b47486c2485c76136172c87f0df16ee9dc4cb85be7d77ce274328f92735'
            'f96b27d2f826bf4e1c96f0154516c1e2cf07536f745128a9c2e5ec113cea6446'
            '8600908031ef96c9bd4a989ab351db02668a3ce7f322e21b398ce042d1967309'
            '5eafcfd21666d63fe19875a0e3d05761bd2ce1ee5f938255ea048de117f2d942'
            '0f0f4b93e86351044f3eab49967d22b7bff458e9eaaf112e7877458d1f0427be'
            '5dfe00e15a2dbf461d0b48107b4a994ef9444801e5f9b7083a4b020e634db67f')
sha256sums_x86_64=('9f2b0bdec4aa1fe9916981694f922b6e93e7fb80d2b2d5bda80c25d837c3fdda')

prepare() {
	# Remove useless things
    dir=$srcdir/$pkgname-$pkgver/
    cd $dir
    patch -Np1 -i "$srcdir/build.patch"
    patch -Np1 -i "$srcdir/argv.patch"
    patch -Np1 -i "$srcdir/path.patch"
    sed -i '/\"electron\":/d' package.json
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
    [ -e ./electron ] && rm -r ./electron

    # Install Other things
    install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

    # Install icons
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
        install -Dm644 $srcdir/$pkgname-$pkgver/build/icons/$i.png $pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png
    done
}
