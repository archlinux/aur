# Contributor: David Birks <david@tellus.space>
# Contributor: Simon Doppler (dopsi) <dop.simon@gmail.com>
# Contributor: dpeukert

pkgname=marktext
pkgver=0.15.1
pkgrel=2
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability'
arch=('x86_64')
url='https://github.com/marktext/marktext'
license=('MIT')
conflicts=('marktext-bin' 'marktext-git')
depends=('electron')
makedepends=('nodejs' 'yarn' 'npm' 'python2' 'libxkbfile' 'git')
source=("$pkgname-$pkgver.tar.gz::http://github.com/marktext/marktext/archive/v$pkgver.tar.gz"
        'marktext.sh')
sha512sums=('d78954493c0035f6d7b85b84798bf1bb6093fc276f2b9d50e1cf78d32dbc72a0629f33c6d56985d6ddb8b26b89cfb46077e03a929f63f12a1cde4eb807bc02c0'
            '8927cea6815420206982263d80fa54bbcfcc37623008b6a2f25d16782cfdff70ef44c3dbc142e2c45b474df52f216e7d58cf556a525df0683bc447481ab7b27d')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    yarn install
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    yarn run build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Install app.asar and launcher script
    install -D build/linux-unpacked/resources/app.asar "${pkgdir}/usr/share/marktext/app.asar"
    cp -r build/linux-unpacked/resources/app.asar.unpacked "${pkgdir}/usr/share/marktext/app.asar.unpacked"
    install -D "${srcdir}/marktext.sh" "${pkgdir}/usr/bin/marktext"

    # Install desktop file and icon
    install -D resources/linux/marktext.desktop "${pkgdir}/usr/share/applications/marktext.desktop"
    install -D resources/icons/icon.png "${pkgdir}/usr/share/pixmaps/marktext.png"

    # Install license file
    install -D LICENSE "${pkgdir}/usr/share/licenses/marktext/LICENSE"
    install -D build/linux-unpacked/LICENSE.electron.txt "${pkgdir}/usr/share/licenses/marktext/LICENSE.electron.txt"
    install -D build/linux-unpacked/LICENSES.chromium.html "${pkgdir}/usr/share/licenses/marktext/LICENSES.chromium.html"
}