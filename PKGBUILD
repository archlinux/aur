# Maintainer: Ariel AxionL <axionl@aosc.io>

pkgname=electron-ssr
pkgver=0.2.4
pkgrel=1
pkgdesc='Shadowsocksr client using electron.'
arch=('x86_64')
conflicts=("electron-ssr-git")
provides=("electron-ssr")
url='https://github.com/erguotou520/electron-ssr'
license=('MIT')
depends=('gtk2' 'gconf' 'alsa-lib' 
         'libxss' 'nss' 'libxtst')
makedepends=('yarn' 'npm' 'hicolor-icon-theme')
optdepends=('libsodium: sodium crypto support')

source=('https://raw.githubusercontent.com/erguotou520/electron-ssr/master/LICENSE'
        'icons.tar.gz'
        'electron-ssr.desktop'
        'electron-ssr.patch')

source_x86_64=("https://github.com/erguotou520/electron-ssr/archive/v$pkgver.tar.gz")

sha256sums=('87561b47486c2485c76136172c87f0df16ee9dc4cb85be7d77ce274328f92735'
            '0d4372037676a0ee8f17f7cb875192923062a80ad61695dbe4548fde609d7698'
            '5adc01a09122a97fec15bce51a6830c210985f05df0c8aa83c7103ab7c0f7fbd'
            'c85164668da8cfdecad69e5f5545b433390116eed958c47f611e4b2153992970')
sha256sums_x86_64=('749ec7ccfeb6ff161340294e563910bdee481741bfd591e830c5bac8210ef1a9')

prepare() {
	# Remove useless things
    dir=$srcdir/$pkgname-$pkgver/
    cd $dir
    patch -Np1 -i "$srcdir/$pkgname.patch"
}

build() {
    dir=$srcdir/$pkgname-$pkgver/
    cd $dir

    # Build Package
    yarn
    npm run build

    # Extract Package
    buildDir=$srcdir/$pkgname-$pkgver-build/
    install -dm755 $buildDir
    tar xf ./build/$pkgname-$pkgver.tar.gz -C $buildDir
}

package() {
    # Create path
    install -dm755 $pkgdir/opt/$pkgname
    install -dm755 $pkgdir/usr/bin

    # Install Other things
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

    cd $srcdir
    cd icons
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256; do
        install -Dm644 $i.png $pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png
    done

    # Install main programs
    buildDir=$srcdir/$pkgname-$pkgver-build/$pkgname-$pkgver
    cp -r $buildDir/* $pkgdir/opt/$pkgname
    ln -s /opt/$pkgname/$pkgname $pkgdir/usr/bin/$pkgname
}
