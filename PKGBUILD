# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=graviton
_pkgname=Graviton-App
pkgver=1.2.0
pkgrel=2
pkgdesc='A modern Code Editor'
arch=('x86_64')
url='https://graviton.netlify.app/'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils')
makedepends=('npm')
provides=("graviton")
options=('!strip')

source=("https://github.com/Graviton-Code-Editor/Graviton-App/archive/$pkgver.tar.gz"
        'graviton.desktop'
        'build.patch')

sha256sums=('d79857465d977347f698e0495e0447afbf9cac4e258e052e4be7a4b93b7237be'
            '8f3ef4f93bb38ed985088e8fe6b58906ab549bbb78ed6e49d0c7b12b993f7ee3'
            '402df175a9915341df076f7d5a5131377e6feaf46f2057844b1b73608e317ec5')

prepare() {
    cd $srcdir/${_pkgname}-$pkgver
    patch -Np1 -i "$srcdir/build.patch"
}

build() {
    cd $srcdir/${_pkgname}-$pkgver
    npm install
    npm run build
}

package() {
    # Install 
    cd "$srcdir/${_pkgname}-$pkgver/dist/linux-unpacked"
    install -dm755 "$pkgdir/opt/Graviton"
    install -dm755 "$pkgdir/usr/bin"
    cp -r * "$pkgdir/opt/Graviton"
    ln -s /opt/Graviton/graviton "$pkgdir/usr/bin/graviton"

    # Install Other things
    install -Dm644 "$srcdir/${_pkgname}-$pkgver/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

    # Install icons
    for i in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512; do
        install -Dm644 "$srcdir/${_pkgname}-$pkgver/assets/linux/$i.png" "$pkgdir/usr/share/icons/hicolor/$i/apps/$pkgname.png"
    done
}
