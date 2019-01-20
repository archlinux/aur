# Maintainer: Bruce Zhang <zttt183525594@gmail.com>
# Contributor: Ariel AxionL <axionl@aosc.io>

pkgname=electron-ssr
pkgver=0.2.5
pkgrel=1
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
        'electron-ssr.sh')

source_x86_64=("$pkgname-$pkgver.tar.gz::https://github.com/erguotou520/electron-ssr/archive/v$pkgver.tar.gz")

sha256sums=('87561b47486c2485c76136172c87f0df16ee9dc4cb85be7d77ce274328f92735'
            '0d4372037676a0ee8f17f7cb875192923062a80ad61695dbe4548fde609d7698'
            '5adc01a09122a97fec15bce51a6830c210985f05df0c8aa83c7103ab7c0f7fbd'
            'c7e02424f73108543e7ae40907b87e5544479d261c1959604fc407f5a417b154'
            '2c18adbf1e8264698674853de1e4ec3a26bb457fafc9eea712019960cbd4e7a2')
sha256sums_x86_64=('2cc79109fa9dee400482ebc91a19ac1c96046d7788a40641ea4ee75fc3b04101')

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
