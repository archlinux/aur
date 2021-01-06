# Maintainer: ventusliberum <dafeinayius@gmail.com>

pkgname=graviton
_pkgname=Graviton-App
pkgver=2.1.6
pkgrel=1
pkgdesc='A modern Code Editor'
arch=('x86_64')
url='https://graviton.netlify.app/'
license=('MIT')
depends=('libappindicator-gtk3' 'libnotify' 'libxss' 'nss' 'xdg-utils')
makedepends=('npm')
provides=("graviton")
conflicts=("graviton-bin")

source=("https://github.com/Graviton-Code-Editor/Graviton-App/archive/v${pkgver}.tar.gz"
        'graviton.desktop'
        'build.patch')

sha256sums=('f1801f53f810b78f593a95e5c05882af41ed6053784262450fe6a7d89640baea'
            '274abb2bef19694a483dc0f9d1bad14ad397b68e9e07f13580eac4cecc5163dd'
            '021eac4c4cb19d3e425d716c15d4577b3ed9cdcb5b0a35fcb9115ac3efd823fc')

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
    install -Dm644 "$srcdir/${_pkgname}-$pkgver/assets/logo.svg" "$pkgdir/usr/share/icons/$pkgname.svg"
}
